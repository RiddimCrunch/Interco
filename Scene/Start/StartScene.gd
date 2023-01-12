extends Control


onready var background = $Background
onready var optionBackground = $SettingsMenu/OptionBackground
onready var controleBackground = $ControleMenu/ControleBackground
onready var customBackground = $CustomMenu/CustomBackground
onready var sonBackground = $SonMenu/SonBackground
onready var mainMenu = $MainMenu
onready var sousMenu = $SettingsMenu/sousMenu
onready var settingMenu = $SettingsMenu
onready var controleMenu = $ControleMenu
onready var customMenu = $CustomMenu
onready var sonMenu = $SonMenu

var idx = 0

func _input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	if event.is_action_pressed("escape"):
		idx -= 1

func _ready():
	pass

func _process(delta):
	var offsetVector = Vector2(OS.window_size.x, OS.window_size.y)
	var offsetVectorMainMenu = Vector2(OS.window_size.x/2 - 125, OS.window_size.y/2 + 75)
	var offsetVectorSousMenu = Vector2(OS.window_size.x/2 - 125, OS.window_size.y/2 + 20)
	var offsetVectorMainMenuFull = Vector2(OS.window_size.x/2 - 240, OS.window_size.y/2 + 130)
	var offsetVectorSousMenuFull = Vector2(OS.window_size.x/2 - 240, OS.window_size.y/2 + 30)
	background.set_size(offsetVector)
	optionBackground.set_size(offsetVector)
	controleBackground.set_size(offsetVector)
	customBackground.set_size(offsetVector)
	sonBackground.set_size(offsetVector)
	mainMenu.set_position(offsetVectorMainMenu)
	
	if OS.window_fullscreen == true:
		mainMenu.set_scale(Vector2(1.9, 1.9))
		mainMenu.set_position(offsetVectorMainMenuFull)
		sousMenu.set_scale(Vector2(1.9, 1.9))
		sousMenu.set_position(offsetVectorSousMenuFull)
	else:
		mainMenu.set_scale(Vector2(1,1))
		mainMenu.set_position(offsetVectorMainMenu)
		sousMenu.set_scale(Vector2(1,1))
		sousMenu.set_position(offsetVectorSousMenu)
		
	if Input.is_action_pressed("escape"):
		if idx == 0:
			settingMenu.hide()
		if idx == 1:
			controleMenu.hide()
			customMenu.hide()
			sonMenu.hide()
		
func _on_Start_pressed():
	get_tree().change_scene("res://Scene/World/World.tscn")


func _on_Option_pressed():
	settingMenu.show()
	idx += 1


func _on_Quit_pressed():
	get_tree().quit()


func _on_Controle_pressed():
	controleMenu.show()
	idx += 1


func _on_Custom_pressed():
	customMenu.show()
	idx +=1


func _on_Son_pressed():
	sonMenu.show()
	idx +=1
