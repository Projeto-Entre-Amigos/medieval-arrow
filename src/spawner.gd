extends Node2D

# Instancia objeto em tempo aleatorio
# Instancia numero aleatorio de objetos
# Deleta objetos assim que saem do escopo(transcendem os limites da tela)

export(float) var min_intervalo = 0
export(float) var max_intervalo = 10
export(int) var min_quantidade = 0
export(int) var max_quantidade = 10

var spawn = preload ("../scene/player.tscn")
onready var timer = get_child(0)

func _ready():
	randomize()
	timer.set_wait_time(rand_range(min_intervalo, max_intervalo))
	timer.connect("timeout", self, "_spawn")
	print ("Iniciando spawner")

func _spawn():
	# Para cada inimigo novo criamos uma instancia
	var spawned = spawn.instance ()
	add_child(spawned)
	# Coloca novo valor para criação dos inimigos
	timer.set_wait_time(rand_range(min_intervalo, max_intervalo))