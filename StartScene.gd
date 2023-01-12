extends Control


onready var background = $Background


func _input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var offsetVector = Vector2(OS.window_size.x, OS.window_size.y)
	background.set_size(offsetVector)
