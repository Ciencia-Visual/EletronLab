extends Node2D

var particulas = [
	{"pos": Vector2(-150, -80), "tipo": 1},
	{"pos": Vector2(-70, -140), "tipo": -1},
	{"pos": Vector2(20, -100), "tipo": 1},
	{"pos": Vector2(110, -130), "tipo": -1},
	{"pos": Vector2(-170, 10), "tipo": -1},
	{"pos": Vector2(-80, -20), "tipo": 1},
	{"pos": Vector2(10, 20), "tipo": -1},
	{"pos": Vector2(100, 0), "tipo": 1},
	{"pos": Vector2(170, 40), "tipo": -1},
	{"pos": Vector2(-130, 100), "tipo": 1},
	{"pos": Vector2(-30, 110), "tipo": -1},
	{"pos": Vector2(70, 100), "tipo": 1},
	{"pos": Vector2(150, 120), "tipo": -1}
]

func _draw():

	for particula in particulas:

		var posicao = particula["pos"]
		var tipo = particula["tipo"]

		if tipo == 1:
			draw_circle(
				posicao,
				11,
				Color(1.0, 0.35, 0.35, 1.0)
			)

			draw_string(
				ThemeDB.fallback_font,
				posicao + Vector2(-5, 6),
				"+",
				HORIZONTAL_ALIGNMENT_LEFT,
				-1,
				16,
				Color.WHITE
			)

		else:
			draw_circle(
				posicao,
				11,
				Color(0.3, 0.8, 1.0, 1.0)
			)

			draw_string(
				ThemeDB.fallback_font,
				posicao + Vector2(-5, 6),
				"−",
				HORIZONTAL_ALIGNMENT_LEFT,
				-1,
				16,
				Color.WHITE
			)
