extends Control


@export var carga_geradora: Control

# Quantidade de linhas de campo
@export var quantidade_linhas: int = 16

# Raio máximo do campo
@export var raio_campo: float = 220.0

# Tamanho de cada tracejado
@export var tamanho_traco: float = 12.0

# Espaço entre os tracejados
@export var tamanho_espaco: float = 8.0

# Espessura das linhas
@export var espessura: float = 2.0


func _process(_delta):
	queue_redraw()


func _draw():

	if carga_geradora == null:
		return


	# ==========================================
	# CENTRO DA CARGA
	# ==========================================

	var centro = (
		carga_geradora.global_position
		+ Vector2(70, 70)
		- global_position
	)


	# ==========================================
	# DESENHA AS LINHAS RADIAIS
	# ==========================================

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


		# ==========================================
		# CARGA NEGATIVA
		# ==========================================
		# As linhas do campo apontam PARA a carga.


		var ponto_externo = (
			centro
			+ direcao * raio_campo
		)


		var ponto_interno = (
			centro
			+ direcao * 80.0
		)


		desenhar_linha_tracejada(
			ponto_externo,
			ponto_interno
		)


func desenhar_linha_tracejada(
	inicio: Vector2,
	fim: Vector2
):

	var vetor = fim - inicio
	var distancia = vetor.length()


	if distancia <= 0:
		return


	var direcao = vetor.normalized()

	var percorrido := 0.0


	while percorrido < distancia:

		var inicio_traco = (
			inicio
			+ direcao * percorrido
		)


		var fim_traco = (
			inicio_traco
			+ direcao * tamanho_traco
		)


		# Impede que o último tracejado ultrapasse o final

		if (
			percorrido
			+ tamanho_traco
			> distancia
		):

			fim_traco = fim


		draw_line(
			inicio_traco,
			fim_traco,
			Color(0.3, 0.8, 1.0, 0.65),
			espessura
		)


		percorrido += (
			tamanho_traco
			+ tamanho_espaco
		)
