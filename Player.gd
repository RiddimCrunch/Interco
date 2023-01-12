extends KinematicBody2D

onready var _weapon = $Fork

const SPEED = 400
const ACCEL = 0.4

var velocity = Vector2.ZERO
var health = 100

enum { MOVE, ATTACK, IDLE }
var states = MOVE

func _ready():
	pass

func _physics_process(delta):
	var input_vector = get_input()
	
	#Control if player move or not
	if input_vector == Vector2.ZERO:
		states = IDLE
	else:
		states = MOVE
	
	if Input.is_action_just_pressed("attack"):
		states = ATTACK
	
	match states:
		MOVE:
			move_action()
		ATTACK:
			attack_action()
		IDLE:
			pass


func move_action():
	var input_vector = get_input()
	velocity = move_and_slide(lerp(velocity, input_vector * SPEED, ACCEL), Vector2.UP)

func attack_action():
	
	$Fork/AnimationPlayer.play("Attack");
	
	print("ATTACK")

func get_input():
	var input_vector := Vector2.ZERO
	input_vector.x = float(Input.is_action_pressed("right")) - float(Input.is_action_pressed("left"))
	input_vector.y = float(Input.is_action_pressed("down")) - float(Input.is_action_pressed("up"))

	return input_vector.normalized() if input_vector.length() > 1 else input_vector
