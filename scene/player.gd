extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var jumping = false;

func _ready():
	set_process(true)
	# Called every time the node is added to the scene.
	# Initialization here
func _process(delta):
	if (Input.is_action_pressed("jump") && !jumping):
		set_linear_velocity(Vector2(0,-100))
		jumping = true
	if (get_linear_velocity() == Vector2 (0,0)):
		jumping = false
	print (get_linear_velocity())