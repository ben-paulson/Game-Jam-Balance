extends KinematicBody2D

var velocity = Vector2(0, 0)
const GRAVITY = 30
const JUMP_HEIGHT = -600
const SPEED = 200
const UP = Vector2(0, -1)

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	else:
		velocity.x = 0
		
	velocity.y += GRAVITY
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_HEIGHT
		
	velocity = move_and_slide(velocity, UP)
