class_name MvnBody


## Constants for MVN Body
##
## This script contains the definitions required to interpret the MVN body and
## translate it into XRBodyTracker format.


## Enumeration of MVN joints
enum Joint {
	# Body Joints
	PELVIS = 0,
	L5 = 1,
	L3 = 2,
	T12 = 3,
	T8 = 4,
	NECK = 5,
	HEAD = 6,
	RIGHT_SHOULDER = 7,
	RIGHT_UPPER_ARM = 8,
	RIGHT_FOREARM = 9,
	RIGHT_HAND = 10,
	LEFT_SHOULDER = 11,
	LEFT_UPPER_ARM = 12,
	LEFT_FOREARM = 13,
	LEFT_HAND = 14,
	RIGHT_UPPER_LEG = 15,
	RIGHT_LOWER_LEG = 16,
	RIGHT_FOOT = 17,
	RIGHT_TOE = 18,
	LEFT_UPPER_LEG = 19,
	LEFT_LOWER_LEG = 20,
	LEFT_FOOT = 21,
	LEFT_TOE = 22,

	# Left Hand Joints
	LEFT_CARPUS = 23,
	LEFT_THUMB_METACARPAL = 24,
	LEFT_THUMB_PROXIMAL = 25,
	LEFT_THUMB_DISTAL = 26,
	LEFT_INDEX_METACARPAL = 27,
	LEFT_INDEX_PROXIMAL = 28,
	LEFT_INDEX_INTERMEDIATE = 29,
	LEFT_INDEX_DISTAL = 30,
	LEFT_MIDDLE_METACARPAL = 31,
	LEFT_MIDDLE_PROXIMAL = 32,
	LEFT_MIDDLE_INTERMEDIATE = 33,
	LEFT_MIDDLE_DISTAL = 34,
	LEFT_RING_METACARPAL = 35,
	LEFT_RING_PROXIMAL = 36,
	LEFT_RING_INTERMEDIATE = 37,
	LEFT_RING_DISTAL = 38,
	LEFT_PINKY_METACARPAL = 39,
	LEFT_PINKY_PROXIMAL = 40,
	LEFT_PINKY_INTERMEDIATE = 41,
	LEFT_PINKY_DISTAL = 42,

	# RIGHT Hand Joints
	RIGHT_CARPUS = 43,
	RIGHT_THUMB_METACARPAL = 44,
	RIGHT_THUMB_PROXIMAL = 45,
	RIGHT_THUMB_DISTAL = 46,
	RIGHT_INDEX_METACARPAL = 47,
	RIGHT_INDEX_PROXIMAL = 48,
	RIGHT_INDEX_INTERMEDIATE = 49,
	RIGHT_INDEX_DISTAL = 50,
	RIGHT_MIDDLE_METACARPAL = 51,
	RIGHT_MIDDLE_PROXIMAL = 52,
	RIGHT_MIDDLE_INTERMEDIATE = 53,
	RIGHT_MIDDLE_DISTAL = 54,
	RIGHT_RING_METACARPAL = 55,
	RIGHT_RING_PROXIMAL = 56,
	RIGHT_RING_INTERMEDIATE = 57,
	RIGHT_RING_DISTAL = 58,
	RIGHT_PINKY_METACARPAL = 59,
	RIGHT_PINKY_PROXIMAL = 60,
	RIGHT_PINKY_INTERMEDIATE = 61,
	RIGHT_PINKY_DISTAL = 62,

	# Count
	COUNT = 63
}


## Mapping of XRBodyTracker joints to MVN joints
const JOINT_MAPPING : Array[Dictionary] = [
	# Upper Body Joints
	{
		body = XRBodyTracker.JOINT_HIPS,
		native = Joint.PELVIS,
		roll = Quaternion(0.5, 0.5, 0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_SPINE,
		native = Joint.L5,
		roll = Quaternion(0.5, 0.5, 0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_CHEST,
		native = Joint.T12,
		roll = Quaternion(0.5, 0.5, 0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_UPPER_CHEST,
		native = Joint.T8,
		roll = Quaternion(0.5, 0.5, 0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_NECK,
		native = Joint.NECK,
		roll = Quaternion(0.5, 0.5, 0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_HEAD,
		native = Joint.HEAD,
		roll = Quaternion(0.5, 0.5, 0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_SHOULDER,
		native = Joint.LEFT_SHOULDER,
		roll = Quaternion(0.0, 0.0, 0.0, 1.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_UPPER_ARM,
		native = Joint.LEFT_UPPER_ARM,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_LOWER_ARM,
		native = Joint.LEFT_FOREARM,
		roll = Quaternion(0.0, 0.7071068, 0.0, 0.7071068)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_SHOULDER,
		native = Joint.RIGHT_SHOULDER,
		roll = Quaternion(0.0, 0.0, 1.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_UPPER_ARM,
		native = Joint.RIGHT_UPPER_ARM,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_LOWER_ARM,
		native = Joint.RIGHT_FOREARM,
		roll = Quaternion(0.7071068, 0.0, 0.7071068, 0.0)
	},

	# Lower Body Joints
	{
		body = XRBodyTracker.JOINT_LEFT_UPPER_LEG,
		native = Joint.LEFT_UPPER_LEG,
		roll = Quaternion(-0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_LOWER_LEG,
		native = Joint.LEFT_LOWER_LEG,
		roll = Quaternion(0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_FOOT,
		native = Joint.LEFT_FOOT,
		roll = Quaternion(0.0, 0.0, -0.7071068, 0.7071068)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_UPPER_LEG,
		native = Joint.RIGHT_UPPER_LEG,
		roll = Quaternion(-0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_LOWER_LEG,
		native = Joint.RIGHT_LOWER_LEG,
		roll = Quaternion(0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_FOOT,
		native = Joint.RIGHT_FOOT,
		roll = Quaternion(0.0, 0.0, -0.7071068, 0.7071068)
	},

	# Left Hand Joints
	{
		body = XRBodyTracker.JOINT_LEFT_HAND,
		native = Joint.LEFT_HAND,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_PALM,
		native = Joint.LEFT_HAND,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_THUMB_METACARPAL,
		native = Joint.LEFT_THUMB_METACARPAL,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_THUMB_PHALANX_PROXIMAL,
		native = Joint.LEFT_THUMB_PROXIMAL,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_THUMB_PHALANX_DISTAL,
		native = Joint.LEFT_THUMB_DISTAL,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_INDEX_FINGER_METACARPAL,
		native = Joint.LEFT_INDEX_METACARPAL,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_INDEX_FINGER_PHALANX_PROXIMAL,
		native = Joint.LEFT_INDEX_PROXIMAL,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_INDEX_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.LEFT_INDEX_INTERMEDIATE,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_INDEX_FINGER_PHALANX_DISTAL,
		native = Joint.LEFT_INDEX_DISTAL,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_MIDDLE_FINGER_METACARPAL,
		native = Joint.LEFT_MIDDLE_METACARPAL,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_MIDDLE_FINGER_PHALANX_PROXIMAL,
		native = Joint.LEFT_MIDDLE_PROXIMAL,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_MIDDLE_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.LEFT_MIDDLE_INTERMEDIATE,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_MIDDLE_FINGER_PHALANX_DISTAL,
		native = Joint.LEFT_MIDDLE_DISTAL,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_RING_FINGER_METACARPAL,
		native = Joint.LEFT_RING_METACARPAL,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_RING_FINGER_PHALANX_PROXIMAL,
		native = Joint.LEFT_RING_PROXIMAL,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_RING_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.LEFT_RING_INTERMEDIATE,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_RING_FINGER_PHALANX_DISTAL,
		native = Joint.LEFT_RING_DISTAL,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_PINKY_FINGER_METACARPAL,
		native = Joint.LEFT_PINKY_METACARPAL,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_PINKY_FINGER_PHALANX_PROXIMAL,
		native = Joint.LEFT_PINKY_PROXIMAL,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_PINKY_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.LEFT_PINKY_INTERMEDIATE,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_PINKY_FINGER_PHALANX_DISTAL,
		native = Joint.LEFT_PINKY_DISTAL,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},

	# Right Hand Joints
	{
		body = XRBodyTracker.JOINT_RIGHT_HAND,
		native = Joint.RIGHT_HAND,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_PALM,
		native = Joint.RIGHT_HAND,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_THUMB_METACARPAL,
		native = Joint.RIGHT_THUMB_METACARPAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_THUMB_PHALANX_PROXIMAL,
		native = Joint.RIGHT_THUMB_PROXIMAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_THUMB_PHALANX_DISTAL,
		native = Joint.RIGHT_THUMB_DISTAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_INDEX_FINGER_METACARPAL,
		native = Joint.RIGHT_INDEX_METACARPAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_INDEX_FINGER_PHALANX_PROXIMAL,
		native = Joint.RIGHT_INDEX_PROXIMAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_INDEX_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.RIGHT_INDEX_INTERMEDIATE,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_INDEX_FINGER_PHALANX_DISTAL,
		native = Joint.RIGHT_INDEX_DISTAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_MIDDLE_FINGER_METACARPAL,
		native = Joint.RIGHT_MIDDLE_METACARPAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_MIDDLE_FINGER_PHALANX_PROXIMAL,
		native = Joint.RIGHT_MIDDLE_PROXIMAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_MIDDLE_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.RIGHT_MIDDLE_INTERMEDIATE,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_MIDDLE_FINGER_PHALANX_DISTAL,
		native = Joint.RIGHT_MIDDLE_DISTAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_RING_FINGER_METACARPAL,
		native = Joint.RIGHT_RING_METACARPAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_RING_FINGER_PHALANX_PROXIMAL,
		native = Joint.RIGHT_RING_PROXIMAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_RING_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.RIGHT_RING_INTERMEDIATE,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_RING_FINGER_PHALANX_DISTAL,
		native = Joint.RIGHT_RING_DISTAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_PINKY_FINGER_METACARPAL,
		native = Joint.RIGHT_PINKY_METACARPAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_PINKY_FINGER_PHALANX_PROXIMAL,
		native = Joint.RIGHT_PINKY_PROXIMAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_PINKY_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.RIGHT_PINKY_INTERMEDIATE,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_PINKY_FINGER_PHALANX_DISTAL,
		native = Joint.RIGHT_PINKY_DISTAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
]


## Joint Data class
class JointData:
	## Joint positions
	var positions : Array[Vector3]

	## Joint rotations
	var rotations : Array[Quaternion]

	## Has fingers flag
	var has_fingers : bool

	# Initialize the Joint Data class
	func _init():
		# Initialize the positions array
		positions = []
		positions.resize(Joint.COUNT)
		positions.fill(Vector3.ZERO)

		# Initialize the rotations array
		rotations = []
		rotations.resize(Joint.COUNT)
		rotations.fill(Quaternion.IDENTITY)
