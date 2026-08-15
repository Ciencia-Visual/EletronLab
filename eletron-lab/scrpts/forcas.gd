extends Node2D


@export var carga_positiva: Control
@export var carga_negativa: Control

# Constante eletrostática
var k := 8.99e9


func _process(_delta):
	queue_redraw()


func _draw():

	if carga_positiva == null or carga_negativa == null:
		return

	# Posição do centro das cargas
	var pos1 = to_local(
		carga_positiva.global_position + Vector2(70, 70)
	)

	var pos2 = to_local(
		carga_negativa.global_position + Vector2(70, 70)
	)

	# Vetor entre as cargas
	var direcao = pos2 - pos1

	# Distância entre as cargas
	var distancia = direcao.length()

	if distancia < 1:
		return

	# Direção normalizada
	var unitario = direcao.normalized()

	# ==========================================
	# INTENSIDADE DAS CARGAS
	# ==========================================

	var intensidade_1 = abs(carga_positiva.valor_carga)
	var intensidade_2 = abs(carga_negativa.valor_carga)

	# Produto dos módulos das cargas
	var produto_cargas = intensidade_1 * intensidade_2

	# ==========================================
	# TAMANHO VISUAL DA SETA
	# ==========================================

	var distancia_referencia := 400.0
	var tamanho_base := 40.0

	# Relação proporcional à Lei de Coulomb:
	# F proporcional a |q1 * q2| / r²

	var intensidade_forca = produto_cargas * pow(
		distancia_referencia / distancia,
		2
	)

	# Escala visual
	var tamanho_seta = tamanho_base * intensidade_forca / 25.0

	# Limites visuais da seta
	tamanho_seta = clamp(
		tamanho_seta,
		10.0,
		220.0
	)

	# ==========================================
	# DIREÇÃO DA FORÇA
	# ==========================================

	var produto_sinais = (
		carga_positiva.valor_carga
		* carga_negativa.valor_carga
	)

	var direcao_1: Vector2
	var direcao_2: Vector2

	if produto_sinais < 0:
		# Sinais opostos → atração

		direcao_1 = unitario
		direcao_2 = -unitario

	else:
		# Mesmo sinal → repulsão

		direcao_1 = -unitario
		direcao_2 = unitario

	# ==========================================
	# DESENHA AS FORÇAS
	# ==========================================

	desenhar_seta(
		pos1,
		direcao_1,
		tamanho_seta
	)

	desenhar_seta(
		pos2,
		direcao_2,
		tamanho_seta
	)


func desenhar_seta(
	posicao: Vector2,
	direcao: Vector2,
	tamanho: float
):

	var ponta = posicao + direcao * tamanho

	# Linha principal
	draw_line(
		posicao,
		ponta,
		Color(1.0, 0.8, 0.1),
		6.0
	)

	# Tamanho da ponta
	var tamanho_ponta := 18.0

	# Vetor perpendicular
	var perpendicular = Vector2(
		-direcao.y,
		direcao.x
	)

	# Pontas da seta
	var ponta1 = (
		ponta
		- direcao * tamanho_ponta
		+ perpendicular * 8
	)

	var ponta2 = (
		ponta
		- direcao * tamanho_ponta
		- perpendicular * 8
	)

	draw_colored_polygon(
		PackedVector2Array([
			ponta,
			ponta1,
			ponta2
		]),
		Color(1.0, 0.8, 0.1)
	)
