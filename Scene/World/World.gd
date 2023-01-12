extends Node2D

onready var player = $Player
onready var enemy = $Navigation2D/Enemy
export(PackedScene) var mob_scene
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#print(player.global_transform.origin)


func _on_Timer_timeout():
	#print(position.distance_to(player.position) - (position.distance_to(enemy.position)))
	#if (position.distance_to(player.position) - (position.distance_to(enemy.position)) < 200 and position.distance_to(player.position) - (position.distance_to(enemy.position)) > -200):
	get_tree().call_group("Enemy", 'get_target_path', player.global_transform.origin)
	#else:
	#	get_tree().call_group("Enemy", 'get_target_path', Vector2(OS.window_size.x/2, OS.window_size.y/2))
	
