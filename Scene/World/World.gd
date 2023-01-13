extends Node2D

onready var player = $Player
onready var enemy = $Navigation2D/"."
export(PackedScene) var mob_scene
 
 
func _ready():
	pass # Replace with function body.


func _process(delta):
	pass
	#print(player.global_transform.origin)


func _on_Timer_timeout():
	#print(position.distance_to(player.position) - (position.distance_to(enemy.position)))
	if is_instance_valid(enemy):
		if enemy.position != null and (position.distance_to(player.position) - (position.distance_to(enemy.position)) < 200) and (position.distance_to(player.position) - (position.distance_to(enemy.position)) > -200):
			get_tree().call_group("Enemy", 'get_target_path', player.global_transform.origin)
		else:
			get_tree().call_group("Enemy", 'get_target_path', Vector2(OS.window_size.x/2, OS.window_size.y/2))
	
