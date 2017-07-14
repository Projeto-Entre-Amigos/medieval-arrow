extends Node2D

export(PackedScene) var spawn
onready var spawnref = load (spawn.get_path())

export(float) var min_intervalo = 0
export(float) var max_intervalo = 10

onready var timer = get_child(0)

func _ready():
	randomize()
	timer.set_wait_time(rand_range(min_intervalo, max_intervalo))
	print ("Iniciando spawner")

func _spawn():
	var spawned = spawnref.instance ()
	spawned.set_global_pos (get_global_pos())
	get_parent().add_child(spawned)
	timer.set_wait_time(rand_range(min_intervalo, max_intervalo))

func _on_timer_timeout():
	_spawn ()
