extends KinematicBody2D

#var speed = 10
var damage = 10
export var dammage = 1
var motion = Vector2.ZERO
#var screen_size = get_viewport_rect().size

#onready var player = get_node("res://Player.tscn") 

enum {
	Attack,
	Walk
}
onready var Player = $"../../Player"
var current_state = Walk
export var speed = 350
var path = []
var cur_path_idx = 0
var target = null
var velocity = Vector2.ZERO
var threshold = .1
var turn_speed = 10

var health = 20

onready var nav = get_parent()
onready var raycast = $RayCast2D

var player : KinematicBody2D

func move_to(_location):
	var _target = _location

func _ready():
#	screen_size = get_viewport_rect().size
	pass
	
func _physics_process(delta):
	if path.size() > 0:
		move_to_target()
		
func _process(delta):
	match current_state:
		Attack:
			$AnimationPlayer.play("Attack")
		Walk:
			$AnimationPlayer.play("Walk")
			$Look.look_at(Player.global_transform.origin)
			rotate(deg2rad($Look.rotation * turn_speed))
			if raycast.is_colliding():
				var collision = raycast.get_collider()
<<<<<<< HEAD
				#print(collision)
=======
>>>>>>> 882bf63e75c5343099e8d44a043378729bf1c495
				if collision.is_in_group("Player"):
					current_state = Attack
					collision.health -= dammage
					#print(collision.health)
			

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
<<<<<<< HEAD


func _on_Enemy_area_body_entered(body):
	if body.name == "Player":
		player = body as Player
		print(player.name)
		var isAttacked = player.get_readyAttack()
		if isAttacked:
			health -= 10
			player.set_readyAttack(0)
			print("As been hit")
		pass
=======
	



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Attack":
		current_state = Walk
>>>>>>> 882bf63e75c5343099e8d44a043378729bf1c495
