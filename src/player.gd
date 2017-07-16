extends RigidBody2D

# Preload: Carrega o recurso em tempo de compilação
var bullet = preload("../scene/bullet.tscn")
var start_pos;

func _ready():
	set_process_input(true)

func _input(ev):
	if (ev.type == InputEvent.MOUSE_BUTTON):
		if (ev.pressed):
			start_pos = ev.pos
		# Verifica a distância clique/toque em relação pressionamento
		# Caso menor que 75 entendemos que foi um movimento errado
		elif(start_pos.distance_to (ev.pos) < 75):
			jump ()
		else:
			var delta_pos = ev.pos - start_pos
			shoot (delta_pos)

func jump (height = 100):
	if (!is_jumping()):
		set_linear_velocity(Vector2(0,-height))

func shoot (impulse):
	var bi = bullet.instance()
	bi.set_pos(Vector2(50, -10))
	bi.set_rot(impulse.angle())
	bi.apply_impulse(Vector2(0, 0), -impulse)
	add_child(bi)

func is_jumping ():
	return (get_linear_velocity().y != 0)
    