extends Control


onready var background = $Background
onready var option = $MainMenu/Option


func _input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

func _ready():
	pass

func _process(delta):
	var offsetVector = Vector2(OS.window_size.x, OS.window_size.y)
	background.set_size(offsetVector)
	



func _on_Start_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_Option_pressed():
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()
