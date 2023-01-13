extends KinematicBody2D

#var speed = 10
var treeDamage = 5
var health = 50
export var dammage = 1
var motion = Vector2.ZERO
var screen_size = get_viewport_rect().size

enum {
	Attack,
	Walk
}
onready var Player = $"../../Player"
var current_state = Walk
export var speed = 400
var path = []
var cur_path_idx = 0
var target = null
var velocity = Vector2.ZERO
var threshold = .1
var turn_speed = 10
#Manure means 'Fumier'
var manureChance = RandomNumberGenerator.new()
var lookingRight = true

onready var nav = get_parent()
onready var raycast = $RayCast2D
onready var raycast2 = $RayCast2D2
onready var _animation = $AnimationTree.get("parameters/playback")
onready var _enemy = $"."
onready var _hearth = preload("res://Hearth.tscn")
onready var _playerHealthBar = $"../../UI/PlayerHealth"
onready var _TreeHealthBar = $"../../Tree/TreeHealthBar"

func move_to(_location):
	var _target = _location

func _ready():
	screen_size = get_viewport_rect().size
	manureChance.randomize()
	pass
	
func _physics_process(delta):
	if path.size() > 0:
		move_to_target()
		
func _process(delta):
	match current_state:
		Attack:
			pass
		Walk:
			_animation.travel("Walk")
			
			if raycast.is_colliding() || raycast2.is_colliding():
				var collision
				if raycast.is_colliding():
					collision = raycast.get_collider()
					self.scale.x = 1.5
				else:
					collision = raycast2.get_collider()
					self.scale.x = -1.5
				
				if collision.is_in_group("Player"):
					_animation.travel("Attack")
					collision.health -= dammage
					collision.get_node("PlayerHealthBar").value = collision.health
					#print(collision.health)
				elif collision.is_in_group("Tree"):
					_animation.travel("Attack")
					collision.health -= treeDamage
					#print(collision.health)
					_TreeHealthBar.value = collision.health
	
	if health <= 0:
		killed()

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

func killed():
	self.queue_free()
		
	var rand_chance = manureChance.randf_range(0, 100)
	if rand_chance > 0 && rand_chance <= 10:
		print("DROPPED")

func _on_Mantis_area_area_entered(area):
	if area.name == "Area2D":
		var player = area.get_parent().get_parent().get_parent() as Player
		
		if player.get_readyAttack():
			#print("Enemy hit")
			health -= player.dammage
			#print(health)

