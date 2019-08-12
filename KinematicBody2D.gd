extends KinematicBody2D

var velocity = Vector2(0, 0)
const GRAVITY = 30
const JUMP_HEIGHT = -600
const SPEED = 300
const UP = Vector2(0, -1)
const ROT_SPEED = 120

var smeg = preload("res://RigidBody2D.gd")

#var head = get_parent().get_parent().get_node("RigidBody2D")

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	else:
		velocity.x = SPEED
		
	if Input.is_action_pressed("ui_down"):
		if rotation_degrees > -45:
			rotation_degrees -= ROT_SPEED * delta
	else:
		if rotation_degrees < 45:
			rotation_degrees += ROT_SPEED * delta
		
	#velocity.y += GRAVITY
	
	if position.x > 5500:
		get_node("Camera2D/Label").text = "You win!"
		get_node("Camera2D/Label").show()
		
	
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_HEIGHT
		
	velocity = move_and_slide(velocity, UP)

