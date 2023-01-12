extends Control


onready var background = $Background

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

func _process(delta):
	var offsetVector = Vector2(OS.window_size.x, OS.window_size.y)
	background.set_size(offsetVector)
