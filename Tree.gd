extends KinematicBody2D

var health = 1000

func _ready():
	$AnimationPlayer.play("PlantBeingAPlant")
	pass 


func _process(delta):
	if health <= 0:
		get_tree().change_scene("res://Scene/End/EndScene.tscn")


func _on_Area2D_area_entered(area):
	if area.is_in_group("Enemy"):
		var enemy = area.get_node($".")
		print("Tree hit!")
		health -= enemy.treeDamage
		print(health)
