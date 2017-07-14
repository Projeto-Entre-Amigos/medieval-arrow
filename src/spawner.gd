extends Node2D

# Instancia objeto em tempo aleatorio
# Instancia numero aleatorio de objetos
# Deleta objetos assim que saem do escopo(transcendem os limites da tela)

export(Object) var spawn
export(float) var min_intervalo = 0
export(float) var max_intervalo = 10
export(int) var min_quantidade_inimigos = 0
export(int) var max_quantidade_inimigos = 10

onready var timer = get_child(0)

func _ready():
	randomize()
	timer.set_wait_time(rand_range(min_intervalo, max_intervalo))
	timer.connect("timeout", self, "_spawn")
	print ("Iniciando spawner")

func _spawn():
	# Para cada inimigo novo criamos uma instancia
	var spawned = spawn.new ()
	print ("Fui chamado")
	# Coloca novo valor para criação dos inimigos
	timer.set_wait_time(rand_range(min_intervalo, max_intervalo))