extends Sprite2D


@export var altura_maxima: float = 35.0
@export var rotacao_maxima: float = 20.0
@export var velocidade: float = 0.4


var intensidade: float = 0.0

var posicao_inicial: Vector2
var rotacao_inicial: float

var fase: float = 0.0



func _ready():

	posicao_inicial = position
	rotacao_inicial = rotation

	fase = randf_range(0.0, TAU)

	intensidade = 0.0

func _process(_delta):

	# Movimento suave
	var movimento = sin(
		Time.get_ticks_msec() * 0.004 * velocidade
		+ fase
	)
	var levantar = (
		altura_maxima
		* intensidade
	)
	position.y = (
		posicao_inicial.y
		- levantar
		+ movimento * 1.5 * intensidade
	)
	
	rotation = (
		rotacao_inicial
		+ deg_to_rad(
			rotacao_maxima
			* intensidade
			* movimento
		)
	)
func definir_intensidade(valor: float):
	intensidade = clamp(
		valor,
		0.0,
		1.0
	)
