extends Sprite2D

@export var altura_maxima: float = 30.0
@export var rotacao_maxima: float = 12.0
@export var velocidade: float = 0.4

var intensidade: float = 0.0

var posicao_inicial: Vector2
var rotacao_inicial: float


func _ready():

	posicao_inicial = position
	rotacao_inicial = rotation

	intensidade = 0.0


func _process(delta):

	var intensidade_suave = intensidade

	position.y = lerp(
		position.y,
		posicao_inicial.y - (
			altura_maxima * intensidade_suave
		),
		velocidade * delta
	)

	rotation = lerp(
		rotation,
		rotacao_inicial - deg_to_rad(
			rotacao_maxima * intensidade_suave
		),
		velocidade * delta
	)


func definir_intensidade(valor: float):

	intensidade = clamp(
		valor,
		0.0,
		1.0
	)
