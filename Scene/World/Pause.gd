extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var pause = $PauseMenu
onready  var option = $OptionMenu
onready var control = $Control
onready var son = $Son

var idx = 0

func _input(event):
	if event.is_action_pressed("escape"):
		idx -= 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("escape"):
		if idx == 0:
			option.hide()
		if idx == 1:
			control.hide()
			son.hide()


func _on_Resume_pressed():
	get_tree().paused = false
	pause.hide()

func _on_MainMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scene/Start/StartScene.tscn")


func _on_Quit_pressed():
	get_tree().quit()


