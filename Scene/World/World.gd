extends Node2D

onready var player = $Player
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
	get_tree().call_group("Enemy", 'get_target_path', player.global_transform.origin)
