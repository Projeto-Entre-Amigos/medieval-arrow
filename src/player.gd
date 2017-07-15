extends RigidBody2D

func _ready():
	set_process(true)
	
func _process(delta):
	if (Input.is_action_pressed("jump") && !is_jumping()):
		jump ()
		get_node("anim").play("jumping")
	
	 
func jump (height = 70):
	set_linear_velocity(Vector2(0,-70))
	
	
func is_jumping ():
	return (get_linear_velocity() != Vector2 (0,0))