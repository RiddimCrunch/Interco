extends MeshInstance2D

onready var _player = $".."

var pi2 = 2*PI
var quarterpi = PI / 4

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var mouse_position := get_local_mouse_position()
	rotation += mouse_position.angle() * 0.2
	
	#if rotation >= pi2:
	#	rotation -= pi2
	#elif rotation <= -pi2:
	#	rotation += pi2
	#print("is looking right: ", _player.lookingRight)
	
	if _player.lookingRight:
		scale.x = 1
		scale.y = 1
	else:
		scale.x = -1
		scale.y = -1
