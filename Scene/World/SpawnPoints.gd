extends Node2D

var enemy1 = preload("res://Enemy.tscn")
var enemy2 = preload("res://Enemy2.tscn")
var enemy3 = preload("res://Enemy3.tscn")

export var num_enemies = 20
export var second_between_spawns: float = 1

var enemies_list = [
	enemy1, enemy2, enemy3
]

var pos_list = ["TL", "TM", "TR",
				"ML", "MR", "BL",
				"BM", "BR"]

onready var timer = $MobTimer

var wave = 0
var limit_enemy = 20
var enemies_remaining_to_spawn
var array
var enemy
var scene_root = get_parent()



func _ready():
	randomize()
	enemies_remaining_to_spawn = num_enemies
	timer.wait_time = second_between_spawns
	timer.start()

func _process(delta):
	scene_root = get_parent()
	array = get_tree().get_nodes_in_group("Enemy")


func _on_MobTimer_timeout():
	
	if enemies_remaining_to_spawn > 0:
		wave += 1
		#print(enemies_remaining_to_spawn)
		#print(len(array))
		var rand_enem = randi() % enemies_list.size()

		var new_enemy = enemies_list[rand_enem].instance()
		scene_root.add_child(new_enemy)
		print(scene_root)
		
		randomize()
		var rand_pos = randi() % pos_list.size()
		randomize()
		
		print(get_node(pos_list[rand_pos]).position, "  ", get_node(pos_list[rand_pos]).name)
		
		new_enemy.position = get_node(pos_list[rand_pos]).position
		
		#print(new_enemy.position)
		
		enemies_remaining_to_spawn -= 1
	
	
		if len(array) == limit_enemy:
			print("wave done")
			$CoolDown.start()
			wave_done()
				
			if enemies_remaining_to_spawn == 0:
				array = get_tree().get_nodes_in_group("Enemy")
			if array == []:
				enemies_remaining_to_spawn = num_enemies
				
func wave_done():
	
	if $CoolDown.time_left > 0:
		print($CoolDown.time_left)


func _on_CoolDown_timeout():
	if array == []:
		timer.start()
