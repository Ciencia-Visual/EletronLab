extends Node2D

var eletrons = []

var posicoes_iniciais = [
	Vector2(-80, -20),
	Vector2(-40, 30),
	Vector2(0, -40),
	Vector2(40, 20),
	Vector2(80, -30)
]

func _ready():

	for posicao in posicoes_iniciais:

		var eletron = {
			"posicao": posicao,
			"destino": posicao
		}

		eletrons.append(eletron)

	queue_redraw()


func _draw():

	for eletron in eletrons:

		draw_circle(
			eletron["posicao"],
			7,
			Color(0.3, 0.8, 1.0)
		)

		draw_string(
			ThemeDB.fallback_font,
			eletron["posicao"] + Vector2(-4, 5),
			"−",
			HORIZONTAL_ALIGNMENT_LEFT,
			-1,
			14,
			Color.WHITE
		)
