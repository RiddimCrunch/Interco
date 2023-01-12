extends KinematicBody2D

#var speed = 10
var damage = 10
export var dammage = 1
var motion = Vector2.ZERO
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
var player : KinematicBody2D

onready var nav = get_parent()
onready var raycast = $RayCast2D

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
			pass
		Walk:
			$Look.look_at(Player.global_transform.origin)
			rotate(deg2rad($Look.rotation * turn_speed))
			if raycast.is_colliding():
				var collision = raycast.get_collider()
<<<<<<< HEAD
				#print(collision)
				if collision.is_in_group("Player"):
					collision.health -= dammage
					print(collision.health)
	if health <= 0:
		self.scale.x *= 200
=======
				print(collision)
				if collision.is_in_group("Player"):
					collision.health -= dammage
					print(collision.health)
					
					$Timer.start()
					if ($Timer.time_left > 0):
						speed = 100
			
>>>>>>> 3d632248b06672b45d9e53b47f6e6dbb46fe0b99

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


func _on_Enemy_area_area_entered(area):
	player = area.get_parent().get_parent().get_parent() as Player
	
	if player.get_readyAttack():
		print("Enemy hit")
		health -= player.dammage
		print(health)
	
=======
	
	
<<<<<<< HEAD


func _on_Timer_timeout():
	speed = 350
=======
>>>>>>> 3d632248b06672b45d9e53b47f6e6dbb46fe0b99
>>>>>>> 27520c0ee04f4ad6a1d53a4524d7dd8de96fbc86
