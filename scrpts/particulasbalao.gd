extends Node2D

var estado := 0

var posicoes = [
	Vector2(-130, -70),
	Vector2(-60, -120),
	Vector2(20, -90),
	Vector2(100, -110),
	Vector2(-160, 10),
	Vector2(-80, 30),
	Vector2(10, 0),
	Vector2(100, 30),
	Vector2(160, 60),
	Vector2(-120, 100),
	Vector2(-20, 110),
	Vector2(80, 100)
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
			tipo = -1

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
