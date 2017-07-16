extends RigidBody2D

export(float) var walk_speed

func _integrate_forces(state):
	var lv_y = get_linear_velocity().y
	set_linear_velocity(Vector2(-walk_speed, lv_y))