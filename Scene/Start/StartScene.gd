extends Control


onready var background = $Background
onready var optionBackground = $SettingsMenu/OptionBackground
onready var controleBackground = $ControleMenu/ControleBackground
onready var customBackground = $CustomMenu/CustomBackground
onready var sonBackground = $SonMenu/SonBackground
onready var creditBackground = $CreditMenu/CreditBackground
onready var mainMenu = $MainMenu
onready var sousMenu = $SettingsMenu/sousMenu
onready var settingMenu = $SettingsMenu
onready var controleMenu = $ControleMenu
onready var customMenu = $CustomMenu
onready var sonMenu = $SonMenu
onready var creditMenu = $CreditMenu
onready var CustomGnome = $CustomMenu/CustomGnome
onready var GreenButton = $CustomMenu/Green
onready var RedButton = $CustomMenu/Red
onready var BlueButton = $CustomMenu/Blue

#onready var gnome_sprite = get_node("/root/Player/Sprite")
var red_hat = preload("res://Assets/Player/Gnome.png")
var green_hat = preload("res://Assets/Player/Gnome-green.png")
var blue_hat = preload("res://Assets/Player/Gnome-blue.png")
var idx = 0

func _input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	if event.is_action_pressed("escape"):
		idx -= 1

func _ready():
	$Main.play()

func _process(delta):
	var offsetVector = Vector2(OS.window_size.x, OS.window_size.y)
	var offsetVectorMainMenu = Vector2(OS.window_size.x/2 - 125, OS.window_size.y/2 + 75)
	var offsetVectorSousMenu = Vector2(OS.window_size.x/2 - 125, OS.window_size.y/2 + 20)
	var offsetVectorMainMenuFull = Vector2(OS.window_size.x/2 - 240, OS.window_size.y/2 + 130)
	var offsetVectorSousMenuFull = Vector2(OS.window_size.x/2 - 240, OS.window_size.y/2 + 30)
	var offsetVectorGnome = Vector2(OS.window_size.x/2, OS.window_size.y/2 + 60)
	var offsetVectorButtonGreen = Vector2(OS.window_size.x/2 - 100, OS.window_size.y/2 + 150)
	var offsetVectorButtonRed = Vector2(OS.window_size.x/2 - 30, OS.window_size.y/2 + 150)
	var offsetVectorButtonBlue = Vector2(OS.window_size.x/2 + 40, OS.window_size.y/2 + 150)
	
	background.set_size(offsetVector)
	optionBackground.set_size(offsetVector)
	controleBackground.set_size(offsetVector)
	customBackground.set_size(offsetVector)
	sonBackground.set_size(offsetVector)
	creditBackground.set_size(offsetVector)
	mainMenu.set_position(offsetVectorMainMenu)
	CustomGnome.set_position(offsetVectorGnome)
	GreenButton.set_position(offsetVectorButtonGreen)
	RedButton.set_position(offsetVectorButtonRed)
	BlueButton.set_position(offsetVectorButtonBlue)
	
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
			creditMenu.hide()
		
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


func _on_Crdit_pressed():
	creditMenu.show()
	idx +=1


func _on_Green_pressed():
	$CustomMenu/CustomGnome.animation = "IdleGreen"
	
	Global.curr_gnome = green_hat
	
func _on_Blue_pressed():
	$CustomMenu/CustomGnome.animation = "IdleBlue"
	
	Global.curr_gnome = blue_hat

func _on_Red_pressed():
	$CustomMenu/CustomGnome.animation = "IdleRed"
	
	Global.curr_gnome = red_hat


func _on_VolMaster_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
