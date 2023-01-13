extends KinematicBody2D
class_name Player

onready var _weapon = $Fork
onready var _sprite = $Sprite
onready var _spriteFork = $Fork/Sprite2
onready var pauseMenu = $"../Pause/PauseMenu"
onready var camIn = $Sprite/Camera2D
onready var camOut = $"../Camera2D"
#onready var background = $"../Pause/PauseMenu/PauseBackground"
var state_machine

const SPEED = 400
const ACCEL = 0.4

var velocity = Vector2.ZERO
var health = 100
var dammage = 10
var readyAttack = false

var lookingRight = true

enum { MOVE, ATTACK, IDLE }
var states = MOVE

func _ready():
	_sprite.texture = Global.curr_gnome
	state_machine = $AnimationTree.get("parameters/playback")
	
func _input(event):
	if event.is_action_pressed("escape"):
		if get_tree().paused != true:
			get_tree().paused = true
			pauseMenu.show()
			camOut.current = true
			camIn.current = false
		else:
			get_tree().paused = false
			pauseMenu.hide()
			camIn.current = true
			camOut.current = false

	
func _physics_process(delta):
	#background.set_size(Vector2(OS.window_size.x, OS.window_size.y))
	if get_tree().paused != true:
		var input_vector = get_input()
		
		#Control if player move or not
		if Input.is_action_pressed("attack"):
			states = ATTACK
		elif input_vector == Vector2.ZERO:
			states = IDLE
		else:
			states = MOVE
		
		var dir = Input.get_action_strength("right") - Input.get_action_strength("left")
		
		if dir != 0:
			_sprite.scale.x = dir * 1.5
			
			if dir == -1:
				lookingRight = false
			else:
				lookingRight = true
		
		match states:
			MOVE:
				move_action()
			ATTACK:
				attack_action()
			IDLE:
				idle_action()
				
		if health <= 0:
			get_tree().change_scene("res://Scene/End/EndScene.tscn")


func move_action():
	state_machine.travel("Walk")
	var input_vector = get_input()
	velocity = move_and_slide(lerp(velocity, input_vector * SPEED, ACCEL), Vector2.UP)

func attack_action():
	state_machine.travel("Attack")
	readyAttack = true

func idle_action():
	state_machine.travel("Idle")
	

func get_input():
	var input_vector := Vector2.ZERO
	input_vector.x = float(Input.is_action_pressed("right")) - float(Input.is_action_pressed("left"))
	input_vector.y = float(Input.is_action_pressed("down")) - float(Input.is_action_pressed("up"))

	return input_vector.normalized() if input_vector.length() > 1 else input_vector

func get_readyAttack():
	return readyAttack
