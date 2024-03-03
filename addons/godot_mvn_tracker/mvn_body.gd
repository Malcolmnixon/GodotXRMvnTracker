class_name MvnBody


## Constants for MVN Body
##
## This script contains the definitions required to interpret the MVN body and
## translate it into XRBodyTracker format.


## Enumeration of MVN joints
enum Joint {
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
	COUNT = 23
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

	# Right Hand Joints
	{
		body = XRBodyTracker.JOINT_RIGHT_HAND,
		native = Joint.RIGHT_HAND,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
]


## Joint Data class
class JointData:
	## Joint positions
	var positions : Array[Vector3]

	## Joint rotations
	var rotations : Array[Quaternion]

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
