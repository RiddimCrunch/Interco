extends Control


onready var background = $Background

func _ready():
	$Ded.play()

func _input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

func _process(delta):
	var offsetVector = Vector2(OS.window_size.x, OS.window_size.y)
	background.set_size(offsetVector)

func _on_Restart_pressed():
	get_tree().change_scene("res://Scene/World/World.tscn")
	
func _on_Main_Menu_pressed():
	get_tree().change_scene("res://Scene/Start/StartScene.tscn")
	
func _on_Quit_pressed():
	get_tree().quit()
