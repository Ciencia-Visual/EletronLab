extends Control


@export var carga_geradora: Control
@export var valor_campo: Label


@export var tamanho_sonda: float = 32.0
@export var cor_sonda: Color = Color(0.2, 0.85, 1.0)


var k := 8.99e9



var arrastando := false
var offset_mouse := Vector2.ZERO


func _ready():
	custom_minimum_size = Vector2(
		tamanho_sonda * 2.0,
		tamanho_sonda * 2.0
	)

	size = Vector2(
		tamanho_sonda * 2.0,
		tamanho_sonda * 2.0
	)

	queue_redraw()

	atualizar_campo()


func _process(_delta):

	atualizar_campo()

	queue_redraw()


func _draw():

	var centro = Vector2(
		tamanho_sonda,
		tamanho_sonda
	)


	# Sombra
	draw_circle(
		centro + Vector2(3, 4),
		tamanho_sonda,
		Color(0.0, 0.1, 0.2, 0.45)
	)


	# Corpo da sonda
	draw_circle(
		centro,
		tamanho_sonda,
		cor_sonda.darkened(0.25)
	)


	# Corpo principal
	draw_circle(
		centro,
		tamanho_sonda * 0.88,
		cor_sonda
	)


	# Centro
	draw_circle(
		centro,
		tamanho_sonda * 0.25,
		Color(1, 1, 1, 0.9)
	)


	# Pequeno ponto central
	draw_circle(
		centro,
		tamanho_sonda * 0.10,
		Color(0.1, 0.3, 0.5, 1.0)
	)


func atualizar_campo():

	if carga_geradora == null:
		return

	if valor_campo == null:
		return


	var centro_carga = (
		carga_geradora.global_position
		+ Vector2(70, 70)
	)


	var centro_sonda = (
		global_position
		+ Vector2(
			tamanho_sonda,
			tamanho_sonda
		)
	)


	var distancia_pixels = (
		centro_carga.distance_to(
			centro_sonda
		)
	)


	if distancia_pixels < 1:
		return


	var distancia_metros = (
		distancia_pixels / 1000.0
	)


	var carga_coulomb = (
		abs(carga_geradora.valor_carga)
		* 0.000001
	)




	var campo = (
		k
		* carga_coulomb
		/ pow(distancia_metros, 2)
	)


	var expoente = floor(log(campo) / log(10))
	var mantissa = campo / pow(10, expoente)

	valor_campo.text = (
	"E = %.2f × 10^%.0f N/C"
	% [mantissa, expoente]
)

func _gui_input(event):

	if event is InputEventMouseButton:

		if event.button_index == MOUSE_BUTTON_LEFT:

			if event.pressed:

				arrastando = true

				offset_mouse = (
					global_position
					- event.global_position
				)

				accept_event()

			else:

				arrastando = false

				accept_event()


	elif event is InputEventMouseMotion:

		if arrastando:

			global_position = (
				event.global_position
				+ offset_mouse
			)

			accept_event()
