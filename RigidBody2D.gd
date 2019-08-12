extends RigidBody2D

var lost = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y > 510:
		get_parent().get_node("Player/KinematicBody2D/Camera2D/Label").text = "Loser! ahahaha"
		get_parent().get_node("Player/KinematicBody2D/Camera2D/Label").show()
		get_tree().reload_current_scene()
		lost = false
