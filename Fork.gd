extends MeshInstance2D
class_name Fork

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var mouse_position := get_local_mouse_position()
	rotation += mouse_position.angle() * 0.2
