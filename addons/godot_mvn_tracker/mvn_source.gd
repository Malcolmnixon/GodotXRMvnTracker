class_name MvnSource
extends Object


## MVN Tracker Script
##
## This script processes MVN packets into XRBodyTracker data for
## driving avatars.


## Enumeration of position modes
enum PositionMode {
	FREE,			## Free movement
	CALIBRATE,		## Calibrate horizontal position on the first frame
	LOCKED			## Lock horizontal position
}


## Body tracking flags
const BODY_TRACKING := \
	XRBodyTracker.BODY_FLAG_UPPER_BODY_SUPPORTED | \
	XRBodyTracker.BODY_FLAG_LOWER_BODY_SUPPORTED | \
	XRBodyTracker.BODY_FLAG_HANDS_SUPPORTED

## Joint tracking flags
const JOINT_TRACKING := \
	XRBodyTracker.JOINT_FLAG_ORIENTATION_TRACKED | \
	XRBodyTracker.JOINT_FLAG_ORIENTATION_VALID | \
	XRBodyTracker.JOINT_FLAG_POSITION_TRACKED | \
	XRBodyTracker.JOINT_FLAG_POSITION_VALID


# MVN reader instance
var _mvn_reader : MvnReader = MvnReader.new()

# Body tracker instance to publish tracking data
var _body_tracker : XRBodyTracker = XRBodyTracker.new()

# Position mode
var _position_mode : PositionMode = PositionMode.FREE

# Position calibration
var _position_calibration : Vector3 = Vector3.ZERO

# Calibrated flag
var _position_calibrated : bool = false


# On initialization, construct and register the body tracker and start listening
# for incoming packets.
func _init(
	body_tracker_name : String,
	position_mode : int,
	udp_listener_port : int) -> void:

	# Register the body tracker
	XRServer.add_body_tracker(body_tracker_name, _body_tracker)

	# Save the position mode
	_position_mode = position_mode

	# Start listening for MVN packets
	_mvn_reader.on_mvn_packet.connect(_on_mvn_packet)
	_mvn_reader.listen(udp_listener_port)


# Poll for incoming packets
func poll() -> void:
	_mvn_reader.poll()


# Handle received MVN packet data
func _on_mvn_packet(data : MvnBody.JointData) -> void:
	# Apply to the XRBodyTracker
	for joint in MvnBody.JOINT_MAPPING:
		var body : XRBodyTracker.Joint = joint["body"]
		var native : MvnBody.Joint = joint["native"]
		var roll : Quaternion = joint["roll"]
		var pos := data.positions[native]
		var rot := data.rotations[native]

		# If pelvis then consider position calibration
		if native == MvnBody.Joint.PELVIS:
			match _position_mode:
				PositionMode.CALIBRATE:
					# Calibrate on first position
					if not _position_calibrated:
						_position_calibrated = true
						_position_calibration = pos.slide(Vector3.UP)

				PositionMode.LOCKED:
					# Calibrate on every frame
					_position_calibration = pos.slide(Vector3.UP)

		# Apply calibration
		pos -= _position_calibration

		# Set the joint transform
		_body_tracker.set_joint_transform(
			body,
			Transform3D(
				Basis(rot * roll),
				pos))

		# Set the joint flags
		_body_tracker.set_joint_flags(body, JOINT_TRACKING)

	# Calculate and set the root joint under the hips
	var root := _body_tracker.get_joint_transform(XRBodyTracker.JOINT_HIPS)
	root.basis = Basis.IDENTITY
	root.origin = root.origin.slide(Vector3.UP)
	_body_tracker.set_joint_transform(XRBodyTracker.JOINT_ROOT, root)
	_body_tracker.set_joint_flags(XRBodyTracker.JOINT_ROOT, JOINT_TRACKING)

	# Indicate we are tracking the body
	_body_tracker.body_flags = BODY_TRACKING
	_body_tracker.has_tracking_data = true
