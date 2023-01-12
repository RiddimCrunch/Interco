extends KinematicBody2D

export var dammage = 1

onready var player = get_node("res://Player.tscn") 

enum {
	Attack,
	Move
}
onready var Player = $"../../Player"
var current_state = Move
export var speed = 200
var path = []
var cur_path_idx = 0
var target = null
var velocity = Vector2.ZERO
var threshold = .1
var turn_speed = 10

onready var nav = get_parent()

func move_to(_location):
	var _target = _location

func _ready():
	pass
	
func _physics_process(delta):
	if path.size() > 0:
		move_to_target()
		
func _process(delta):
		match current_state:
			Attack:
				$AnimationPlayer.play("Attack")
				$FlyMoveSprite.hide()
				$Timer.start()
				if ($Timer.time_left > 0):
					speed = 100
			Move:
				$AnimationPlayer.play("Move")
				$FlyAttackSprite.hide()
				rotate(deg2rad($Look.rotation * turn_speed))

func move_to_target():
	if global_transform.origin.distance_to(path[cur_path_idx]) < threshold:
		path.remove(0)
	else:
		var direction = path[cur_path_idx] - global_transform.origin
		velocity = direction.normalized() * speed
		#print(velocity)
		move_and_slide(velocity, Vector2.UP)
		
func get_target_path(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)

func _on_Timer_timeout():
	speed = 350


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Attack":
		current_state = Move


func _on_Area2D_area_entered(area):
	current_state = Attack
