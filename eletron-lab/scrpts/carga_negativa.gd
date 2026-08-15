extends Control


@export var cor_carga: Color = Color(0.391, 0.489, 0.967, 1.0)
@export var tamanho: float = 70.0
@export var valor_carga: float = -5.0




var arrastando := false
var offset_mouse := Vector2.ZERO

func _ready():
	queue_redraw()

func _draw():
	var centro = Vector2(tamanho, tamanho)

	# Sombra
	draw_circle(
		centro + Vector2(5, 8),
		tamanho,
		Color(0.25, 0.0, 0.02, 0.35)
	)

	# Corpo escuro
	draw_circle(
		centro,
		tamanho,
		cor_carga.darkened(0.35)
	)

	# Corpo principal
	draw_circle(
		centro + Vector2(-2, -2),
		tamanho * 0.94,
		cor_carga
	)

	# Iluminação
	draw_circle(
		centro + Vector2(-15, -15),
		tamanho * 0.25,
		cor_carga.lightened(0.25)
	)

	# Reflexo
	draw_circle(
		centro + Vector2(-25, -25),
		tamanho * 0.10,
		Color(1, 1, 1, 0.8)
	)
	
func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				arrastando = true
				offset_mouse = global_position - event.global_position
				accept_event()
			else:
				arrastando = false
				accept_event()

	elif event is InputEventMouseMotion:
		if arrastando:
			global_position = event.global_position + offset_mouse
			accept_event()

func aumentar_carga():
	valor_carga -= 1.0
	
func diminuir_carga():
	valor_carga += 1.0
