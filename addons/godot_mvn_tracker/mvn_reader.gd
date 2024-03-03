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
	# Verify packet size of 760 bytes:
	# - 24-byte header
	# - 23x 32-byte quaternion data segments
	if packet.get_size() != 760:
		return

	# Verify 23 data items
	packet.seek(11)
	if packet.get_u8() != 23:
		return

	# Verify 23 body segments
	packet.seek(17)
	if packet.get_u8() != 23:
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

		# Populate the joint data
		_data.positions[j] = MVN_XFORM * Vector3(px, py, pz)
		_data.rotations[j] = MVN_XFORM * Quaternion(rx, ry, rz, rw)

	# Report the updated data
	on_mvn_packet.emit(_data)
