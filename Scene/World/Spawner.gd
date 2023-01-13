
export(PackedScene) var Enemy
export var num_enemies = 1
export var second_between_spawns: float = 1

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
	if enemies_remaining_to_spawn:
		if len(array) < limit_enemy:
				enemy = Enemy.instance()
				print(enemy)
				#scene_root.add_child(enemy)
				enemies_remaining_to_spawn -= 1
				print(enemies_remaining_to_spawn)
	if enemies_remaining_to_spawn == 0:
		array = get_tree().get_nodes_in_group("Enemy")
		#print(len(array))
		if array == []:
			if num_enemies > 50:
				num_enemies = 50
			else:
				num_enemies += 2
			enemies_remaining_to_spawn = num_enemies
