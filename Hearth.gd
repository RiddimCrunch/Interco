extends Area2D

var healthValue = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Levitate")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Hearth_body_entered(body):
	if body.name == "Player":
		body = body as Player
		
		body.health += healthValue
		
		var overflow = body.health - 100
		
		if overflow > 0:
			body.health -= overflow
			
			print(body.get_parent().get_child(3).name)
			var _tree = body.get_parent().get_child(3)
			_tree.health += overflow
			print("---------------------", _tree.health)
		
		self.queue_free()
