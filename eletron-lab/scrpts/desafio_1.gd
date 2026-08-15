extends Panel


@export var carga_positiva: Control
@export var carga_negativa: Control

@export var resultado: Label

@export var botao_atracao: Button
@export var botao_repulsao: Button

@export var label_pontuacao: Label


# ==========================================
# PONTUAÇÃO
# ==========================================

var pontos := 0
var desafio_concluido := false


# ==========================================
# INÍCIO
# ==========================================

func _ready():

	if botao_atracao != null:
		botao_atracao.modulate = Color.WHITE

	if botao_repulsao != null:
		botao_repulsao.modulate = Color.WHITE

	if resultado != null:
		resultado.text = "Escolha uma resposta!"

	if label_pontuacao != null:
		label_pontuacao.text = "PONTOS: " + str(pontos)


# ==========================================
# VERIFICAR RESPOSTA
# ==========================================

func verificar_resposta(resposta: String):

	if carga_positiva == null:
		return

	if carga_negativa == null:
		return

	if resultado == null:
		return

	if botao_atracao == null:
		return

	if botao_repulsao == null:
		return

	if label_pontuacao == null:
		return


	# ==========================================
	# LIMPA A COR DOS BOTÕES
	# ==========================================

	botao_atracao.modulate = Color.WHITE
	botao_repulsao.modulate = Color.WHITE


	# ==========================================
	# CALCULA O SINAL DAS CARGAS
	# ==========================================

	var produto = (
		carga_positiva.valor_carga
		* carga_negativa.valor_carga
	)


	# ==========================================
	# DESCOBRE A RESPOSTA CORRETA
	# ==========================================

	var resposta_correta: String

	if produto < 0:

		resposta_correta = "atracao"

	else:

		resposta_correta = "repulsao"


	# ==========================================
	# RESPOSTA CORRETA
	# ==========================================

	if resposta == resposta_correta:

		# Verifica se o aluno já ganhou os pontos
		if not desafio_concluido:

			pontos += 10

			desafio_concluido = true

			resultado.text = "✓ CORRETO! +10 pontos"

			label_pontuacao.text = "PONTOS: " + str(pontos)

		else:

			resultado.text = "✓ DESAFIO JÁ CONCLUÍDO!"


		# Deixa o botão correto verde

		if resposta == "atracao":

			botao_atracao.modulate = Color(
				0.3,
				1.0,
				0.3
			)

		else:

			botao_repulsao.modulate = Color(
				0.3,
				1.0,
				0.3
			)


	# ==========================================
	# RESPOSTA ERRADA
	# ==========================================

	else:

		resultado.text = "✗ TENTE NOVAMENTE"


		# Deixa o botão errado vermelho

		if resposta == "atracao":

			botao_atracao.modulate = Color(
				1.0,
				0.3,
				0.3
			)

		else:

			botao_repulsao.modulate = Color(
				1.0,
				0.3,
				0.3
			)


# ==========================================
# BOTÃO ATRAÇÃO
# ==========================================

func _on_botao_atracao_pressed():

	verificar_resposta("atracao")


# ==========================================
# BOTÃO REPULSÃO
# ==========================================

func _on_botao_repulsao_pressed():

	verificar_resposta("repulsao")


# ==========================================
# REINICIAR DESAFIO
# ==========================================

func reiniciar_desafio():

	# Permite ganhar pontos novamente
	desafio_concluido = false


	# Volta os botões para a cor normal

	botao_atracao.modulate = Color.WHITE
	botao_repulsao.modulate = Color.WHITE


	# Limpa o resultado

	resultado.text = "Escolha uma resposta!"


# ==========================================
# BOTÃO REINICIAR
# ==========================================

func _on_botao_reiniciar_pressed():

	reiniciar_desafio()
