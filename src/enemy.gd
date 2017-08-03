extends RigidBody2D

export(float) var walk_speed

func _integrate_forces(state):
	var lv_y = get_linear_velocity().y
	set_linear_velocity(Vector2(-walk_speed, lv_y))

func _on_enemy_body_enter_shape( body_id, body, body_shape, local_shape ):
	print ("Body has been hit ", body_id)
	print (body.get_type ())