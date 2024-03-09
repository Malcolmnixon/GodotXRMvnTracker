class_name MvnReader
extends Object


## MVN Reader Script
##
## This script implements an MVN reader. The listen method is used to start the
## UDP server. The poll method should be called to poll for incoming packets.
## Packets are decoded and dispatched through the on_mvn_packet signal.


## MVN packed received signal
signal on_mvn_packet(data : MvnBody.JointData)


# Transform from Movella to Godot space
const MVN_XFORM := Quaternion(-0.5, 0.5, 0.5, 0.5)


# UDP Server
var _server : UDPServer = UDPServer.new()

# Current connection
var _connection : PacketPeerUDP

# Joint data
var _data := MvnBody.JointData.new()


## Stop listening
func stop() -> void:
	_server.stop()
	_connection = null


## Start listening
func listen(p_port : int = 9763) -> void:
	stop()
	_server.listen(p_port)


## Poll for incoming packets
func poll() -> void:
	# Poll the server
	_server.poll()

	# Switch to any new connection
	if _server.is_connection_available():
		_connection = _server.take_connection()

	# Skip if no connection
	if not _connection:
		return

	# Loop processing the incoming packets
	while _connection.get_available_packet_count() > 0:
		# Read the packet
		var packet := StreamPeerBuffer.new()
		packet.big_endian = true
		packet.data_array = _connection.get_packet()

		_read_mvn_packet(packet)


# Read an MVN datagram packet
func _read_mvn_packet(packet : StreamPeerBuffer) -> void:
	# Skip runt packets
	if packet.get_size() < 24:
		return

	# Get the ID string
	var id := packet.get_string(6)

	# Process supported packets
	match id:
		"MXTP02":
			_read_mvn_pose_quaternion(packet)


# Read an MVN pose quaternion packet
func _read_mvn_pose_quaternion(packet : StreamPeerBuffer) -> void:
	# MVN Packet data consists of:
	# - 24-byte header:
	#   - [ 0 ..  5] ID String        "4d 58 54 50 30 32" = MXTP##
	#   - [ 6 ..  9] Sample Counter   "00 00 03 ef"       = 1007
	#   - [10 .. 10] Datagram Counter "80"                = 128
	#   - [11 .. 11] Number of Items  "3F"                = 63
	#   - [12 .. 15] Time Code        "00 00 10 63"       = 4195
	#   - [16 .. 16] Character ID     "00"                = 0
	#   - [17 .. 17] Body Segments    "17"                = 23 (always)
	#   - [18 .. 18] Props Segments   "00"                = 0  (0 - 4)
	#   - [19 .. 19] Finger Segments  "28"                = 40 (0 / 40)
	#   - [20 .. 21] Reserved         "00 00"
	#   - [22 .. 23] Payload Size     "07 E0"             = 2016
	# - N x 32-byte quaternion data segments

	# Read the payload size and verify we have the full packet
	packet.seek(22)
	var payload := packet.get_u16()
	if 24 + payload != packet.get_size():
		return

	# Read the segment counts
	packet.seek(17)
	var body_segments := packet.get_u8()
	var props_segments := packet.get_u8()
	var finger_segments := packet.get_u8()

	# Verify valid body segments
	if body_segments != 23:
		return

	# Verify valid props segments
	if props_segments > 4:
		return

	# Verify valid finger segments
	if finger_segments != 0 and finger_segments != 40:
		return

	# Process all 23 joint segments
	packet.seek(24)
	for j in MvnBody.Joint.COUNT:
		var id := packet.get_u32()		# Segment ID
		var px := packet.get_float()	# Position (x)
		var py := packet.get_float()	# Position (y)
		var pz := packet.get_float()	# Position (z)
		var rw := packet.get_float()	# Quaternion (re)
		var rx := packet.get_float()	# Quaternion (i)
		var ry := packet.get_float()	# Quaternion (j)
		var rz := packet.get_float()	# Quaternion (k)

		# Populate the body joint data
		_data.positions[j] = MVN_XFORM * Vector3(px, py, pz)
		_data.rotations[j] = MVN_XFORM * Quaternion(rx, ry, rz, rw)

	# Process the fingers
	packet.seek(24 + (body_segments + props_segments) * 32)
	for j in finger_segments:
		var id := packet.get_u32()		# Segment ID
		var px := packet.get_float()	# Position (x)
		var py := packet.get_float()	# Position (y)
		var pz := packet.get_float()	# Position (z)
		var rw := packet.get_float()	# Quaternion (re)
		var rx := packet.get_float()	# Quaternion (i)
		var ry := packet.get_float()	# Quaternion (j)
		var rz := packet.get_float()	# Quaternion (k)

		# Populate the finger joint data
		_data.positions[23 + j] = MVN_XFORM * Vector3(px, py, pz)
		_data.rotations[23 + j] = MVN_XFORM * Quaternion(rx, ry, rz, rw)

	# Indicate if we have finger data
	_data.has_fingers = finger_segments != 0

	# Report the updated data
	on_mvn_packet.emit(_data)
