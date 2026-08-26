extends Node2D


@export var carga_geradora: Control

@export var quantidade_linhas: int = 16
@export var raio_campo: float = 220.0
@export var raio_interno: float = 80.0

# Tracejados
@export var tamanho_traco: float = 18.0
@export var tamanho_espaco: float = 10.0

# Aparência
@export var espessura: float = 2.5
@export var tamanho_seta: float = 7.0


func _process(_delta):
	queue_redraw()


func _draw():

	if carga_geradora == null:
		return

	var centro = to_local(
		carga_geradora.global_position
		+ Vector2(70, 70)
	)

	for i in range(quantidade_linhas):

		var angulo = (
			float(i)
			/ float(quantidade_linhas)
			* TAU
		)

		var direcao = Vector2(
			cos(angulo),
			sin(angulo)
		)
		var inicio: Vector2
		var fim: Vector2
		var direcao_campo: Vector2


		if carga_geradora.valor_carga >= 0:
			inicio = (
				centro
				+ direcao * raio_interno
			)

			fim = (
				centro
				+ direcao * raio_campo
			)

			direcao_campo = direcao


		else:
			inicio = (
				centro
				+ direcao * raio_campo
			)

			fim = (
				centro
				+ direcao * raio_interno
			)

			direcao_campo = -direcao
		desenhar_linha_tracejada(
			inicio,
			fim,
			direcao_campo
		)
func desenhar_linha_tracejada(
	inicio: Vector2,
	fim: Vector2,
	direcao: Vector2
):

	var vetor = fim - inicio

	var distancia = vetor.length()

	if distancia <= 0:
		return


	var percorrido := 0.0

	var contador := 0


	while percorrido < distancia:
		var inicio_traco = (
			inicio
			+ direcao * percorrido
		)
		var comprimento = min(
			tamanho_traco,
			distancia - percorrido
		)
		var fim_traco = (
			inicio_traco
			+ direcao * comprimento
		)

		draw_line(
			inicio_traco,
			fim_traco,
			Color(0.3, 0.8, 1.0, 0.75),
			espessura
		)

		if contador % 3 == 0:

			var posicao_seta = (
				inicio_traco
				+ direcao * (comprimento * 0.5)
			)

			desenhar_ponta_seta(
				posicao_seta,
				direcao
			)

		percorrido += (
			tamanho_traco
			+ tamanho_espaco
		)

		contador += 1

func desenhar_ponta_seta(
	posicao: Vector2,
	direcao: Vector2
):


	var ponta = (
		posicao
		+ direcao * tamanho_seta
	)


	var perpendicular = Vector2(
		-direcao.y,
		direcao.x
	)


	var ponto1 = (
		posicao
		- direcao * tamanho_seta
		+ perpendicular * (tamanho_seta * 0.7)
	)


	var ponto2 = (
		posicao
		- direcao * tamanho_seta
		- perpendicular * (tamanho_seta * 0.7)
	)


	draw_colored_polygon(
		PackedVector2Array([
			ponta,
			ponto1,
			ponto2
		]),
		Color(0.3, 0.8, 1.0, 1.0)
	)
