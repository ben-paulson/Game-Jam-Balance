extends RigidBody2D

# Declare member variables here. Examples:

var rest_len = 100
var min_len = 60
var max_len = 130
var rot_speed = 5

var f_length = rest_len
var r_length = rest_len

var rad = 19
var walk_speed = 5
var walk_angle = 0

var real_f_length
var real_r_length

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		f_length += delta * rot_speed * (min_len  - f_length)
		r_length += delta * rot_speed * (max_len - r_length)
		
		walk_angle += delta * walk_speed
	elif Input.is_action_pressed("ui_right"):
		f_length += delta * rot_speed * (max_len - f_length)
		r_length += delta * rot_speed * (min_len - r_length)
		
		walk_angle -= delta * walk_speed
	else:
		f_length += delta * rot_speed * (rest_len - f_length)
		r_length += delta * rot_speed * (rest_len - r_length)
		
	real_f_length = f_length + sin(walk_angle) * rad
	real_r_length = r_length + sin(walk_angle) * rad
	

	
	get_node("RigidBody2D/Skeleton2D/Front_Thigh").rotation_degrees = rad2deg(atan( (cos(walk_angle)*rad) / real_f_length ) + acos(( -69300 + pow(4 * real_f_length, 2)) / (520 * 4 * real_f_length)))
	get_node("RigidBody2D/Skeleton2D/Front_Thigh/Front_Shin").rotation_degrees = 180 + rad2deg(acos(( 204500 - pow(4 * real_f_length, 2)) / 192400))
	
	get_node("RigidBody2D/Skeleton2D/Back_Thigh").rotation_degrees = rad2deg(atan( (cos(walk_angle)*rad) / real_r_length ) + acos(( -69300 + pow(4 * real_r_length, 2)) / (520 * 4 * real_r_length)))
	get_node("RigidBody2D/Skeleton2D/Back_Thigh/Back_Shin").rotation_degrees = 180 + rad2deg(acos(( 204500 - pow(4 * real_r_length, 2)) / 192400))
	
	get_node("Front_Foot").global_position = get_node("RigidBody2D/Skeleton2D/Front_Thigh/Front_Shin/Front_Foot").global_position
	get_node("Back_Foot").global_position = get_node("RigidBody2D/Skeleton2D/Back_Thigh/Back_Shin/Back_Foot").global_position