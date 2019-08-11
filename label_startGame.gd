extends RichTextLabel

var message = "Start Game"
var level1 = preload("res://Level.tscn")
var hovering = false
var showing_menu = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var mouse_pos = get_viewport().get_mouse_position()
	if mouse_pos[0] > 95 && mouse_pos[0] < 320 && mouse_pos[1] > 360 && mouse_pos[1] < 420:
		bbcode_text = "[color=green]%s[/color]" % message
		hovering = true
	else:
		bbcode_text = "[color=white]%s[/color]" % message
	#print(get_viewport().get_mouse_position())
	
func _input(event):
   # Mouse in viewport coordinates
	if event is InputEventMouseButton:
		if hovering:
			showing_menu = false
			if not showing_menu:
				get_tree().change_scene_to(level1)
