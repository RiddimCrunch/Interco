extends Area2D

var healthValue = 25
onready var _TreeHealthBar = $"../../Tree/TreeHealthBar"

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
		$HpUp.play()
		
		var overflow = body.health - 200
		
		if overflow > 0:
			body.health -= overflow
			
			#print(body.get_parent().get_child(3).name)
			var _tree = body.get_parent().get_child(3) 
			_tree.health += overflow * 10
			_TreeHealthBar.value = _tree.health
		
		body.get_node("PlayerHealthBar").value = body.health
		self.queue_free()
