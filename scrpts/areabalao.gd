extends Area2D


var arrastando := false
var offset_mouse := Vector2.ZERO

var nivel_atrito: float = 0.0

var intensidade_cabelo_menina: float = 0.0
var intensidade_cabelo_menino: float = 0.0

var posicao_anterior := Vector2.ZERO

@export var barra_atrito: ProgressBar

@export var velocidade_retorno_cabelo: float = 0.8


func _ready():

	posicao_anterior = global_position


func _input(event):

	if event is InputEventMouseButton:

		if event.button_index == MOUSE_BUTTON_LEFT:

			if event.pressed:

				var distancia = (
					get_global_mouse_position()
					.distance_to(global_position)
				)

				if distancia <= 120.0:

					arrastando = true

					offset_mouse = (
						global_position
						- get_global_mouse_position()
					)

					get_viewport().set_input_as_handled()

			else:

				if arrastando:

					arrastando = false

					get_viewport().set_input_as_handled()


	elif event is InputEventMouseMotion:

		if arrastando:

			global_position = (
				get_global_mouse_position()
				+ offset_mouse
			)

			get_viewport().set_input_as_handled()


func _process(delta):

	var area_cabelo = get_node_or_null("../Areacabelo")
	var area_cabelo_menino = get_node_or_null("../Areacabelomenino")

	if area_cabelo == null or area_cabelo_menino == null:
		return


	var distancia_movida = (
		global_position
		- posicao_anterior
	).length()

	posicao_anterior = global_position


	var menina_em_contato = area_cabelo.balao_dentro
	var menino_em_contato = area_cabelo_menino.balao_dentro


	if (menina_em_contato or menino_em_contato) and arrastando:

		nivel_atrito += (
			distancia_movida * 0.001
		)

		nivel_atrito = clamp(
			nivel_atrito,
			0.0,
			1.0
		)


	if barra_atrito != null:

		barra_atrito.value = nivel_atrito


	if menina_em_contato:

		intensidade_cabelo_menina = move_toward(
			intensidade_cabelo_menina,
			nivel_atrito,
			0.4 * delta
		)

	else:

		intensidade_cabelo_menina = move_toward(
			intensidade_cabelo_menina,
			0.0,
			velocidade_retorno_cabelo * delta
		)


	if menino_em_contato:

		intensidade_cabelo_menino = move_toward(
			intensidade_cabelo_menino,
			nivel_atrito,
			0.4 * delta
		)

	else:

		intensidade_cabelo_menino = move_toward(
			intensidade_cabelo_menino,
			0.0,
			velocidade_retorno_cabelo * delta
		)


	$"../Fiomenina1".definir_intensidade(
		intensidade_cabelo_menina * 0.8
	)

	$"../Fiomenina2".definir_intensidade(
		intensidade_cabelo_menina * 1.0
	)

	$"../Fiomenina3".definir_intensidade(
		intensidade_cabelo_menina * 0.9
	)

	$"../Fiomenina4".definir_intensidade(
		intensidade_cabelo_menina * 1.1
	)

	$"../Fiomenina5".definir_intensidade(
		intensidade_cabelo_menina * 0.85
	)


	$"../Fiomenino1".definir_intensidade(
		intensidade_cabelo_menino * 0.8
	)

	$"../Fiomenino2".definir_intensidade(
		intensidade_cabelo_menino * 1.0
	)

	$"../Fiomenino3".definir_intensidade(
		intensidade_cabelo_menino * 0.9
	)

	$"../Fiomenino4".definir_intensidade(
		intensidade_cabelo_menino * 1.1
	)

	$"../Fiomenino5".definir_intensidade(
		intensidade_cabelo_menino * 0.85
	)
