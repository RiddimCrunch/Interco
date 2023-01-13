extends Node2D

var enemy1 = preload("res://Enemy.tscn")
var enemy2 = preload("res://Enemy2.tscn")
var enemy3 = preload("res://Enemy3.tscn")

export var num_enemies = 1
export var second_between_spawns: float = 1

var wave = 0;

var enemies_list = [
	enemy1, enemy2, enemy3
]

var pos_list = ["TL", "TM", "TR",
				"ML", "MR", "BL",
				"BM", "BR"]

onready var timer = $MobTimer

var limit_enemy = 20
var enemies_remaining_to_spawn
var array
var enemy
var scene_root = get_parent()



func _ready():
	enemies_remaining_to_spawn = num_enemies
	timer.wait_time = second_between_spawns
	timer.start()

func _process(delta):
	scene_root = get_parent()
	array = get_tree().get_nodes_in_group("Enemy")


func _on_MobTimer_timeout():
	
	var rand_enem = randi() % enemies_list.size()
	
	var new_enemy = enemies_list[rand_enem].instance()
	scene_root.add_child(new_enemy)
	
	
	var rand_pos = randi() % pos_list.size()
	
	print(rand_pos)
	
	new_enemy.position = get_node(pos_list[rand_pos]).position
	
	print(new_enemy.position)
	
	
	
	"""if enemies_remaining_to_spawn:
		if len(array) < limit_enemy:
				#enemy = Enemy.instance()
				print(enemy)
				scene_root.add_child(enemy)
				enemies_remaining_to_spawn -= 1
				print(enemies_remaining_to_spawn)
	if enemies_remaining_to_spawn == 0:
		array = get_tree().get_nodes_in_group("Enemy")
		if array == []:
			if num_enemies > 50:
				num_enemies = 50
			else:
				num_enemies += 2
			enemies_remaining_to_spawn = num_enemies"""
