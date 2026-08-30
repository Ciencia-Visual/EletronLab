extends Node2D

var estado := 0

var posicoes = [
	Vector2(-140, -80),
	Vector2(-70, -110),
	Vector2(0, -70),
	Vector2(70, -100),
	Vector2(140, -60),
	Vector2(-160, 20),
	Vector2(-80, 10),
	Vector2(10, 30),
	Vector2(90, 10),
	Vector2(160, 30),
	Vector2(-100, 100),
	Vector2(0, 90),
	Vector2(100, 100)
]

func _draw():

	for i in range(posicoes.size()):

		var tipo

		if estado == 0:
			if i % 2 == 0:
				tipo = 1
			else:
				tipo = -1

		else:
			tipo = 1

		var cor = Color(1.0, 0.35, 0.35)

		if tipo == -1:
			cor = Color(0.3, 0.8, 1.0)

		draw_circle(
			posicoes[i],
			12,
			cor
		)

		var simbolo = "+"

		if tipo == -1:
			simbolo = "−"

		draw_string(
			ThemeDB.fallback_font,
			posicoes[i] + Vector2(-5, 6),
			simbolo,
			HORIZONTAL_ALIGNMENT_LEFT,
			-1,
			18,
			Color.WHITE
		)

func ficar_carregado():

	estado = 1
	queue_redraw()
