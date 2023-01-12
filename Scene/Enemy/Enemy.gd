extends KinematicBody2D

var speed = 10
var damage = 10

var motion = Vector2.ZERO
var screen_size = get_viewport_rect().size

onready var player = get_node("res://Player.tscn") 

func move_to(_location):
	var _target = _location

func _ready():
	screen_size = get_viewport_rect().size
	pass
	
func _physics_process(delta):

	motion += position.direction_to(player.position)
	
	look_at(player.position)
	
	motion = move_and_slide(motion)
