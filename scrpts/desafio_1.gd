extends Panel


@export var carga_positiva: Control
@export var carga_negativa: Control

@export var resultado: Label

@export var botao_atracao: Button
@export var botao_repulsao: Button

@export var label_pontuacao: Label
@export var desafio2: Control


var pontos := 0
var desafio_concluido := false
var acertos := 0
var acertos_necessarios := 3




func _ready():

	if botao_atracao != null:
		botao_atracao.modulate = Color.WHITE

	if botao_repulsao != null:
		botao_repulsao.modulate = Color.WHITE

	if resultado != null:
		resultado.text = "Escolha uma resposta!"
		

	if label_pontuacao != null:
		label_pontuacao.text = "PONTOS: " + str(pontos)

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


	# Volta os botões ao estado normal
	botao_atracao.modulate = Color.WHITE
	botao_repulsao.modulate = Color.WHITE


	# Produto das cargas
	var produto = (
		carga_positiva.valor_carga
		* carga_negativa.valor_carga
	)


	# Determina a resposta correta
	var resposta_correta: String

	if produto < 0:
		resposta_correta = "atracao"
	else:
		resposta_correta = "repulsao"


	# ==========================================
	# RESPOSTA CORRETA
	# ==========================================

	if resposta == resposta_correta:

		resultado.text = "✓ CORRETO!"

		# Adiciona os pontos somente uma vez
	if not desafio_concluido:
		pontos += 10
		acertos += 1
		desafio_concluido = true

	if label_pontuacao != null:
		label_pontuacao.text = "PONTOS: " + str(pontos)

	if acertos >= acertos_necessarios:

		if desafio2 != null:
			hide()
			desafio2.show()

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


func _on_botaorepulsao_pressed():
	verificar_resposta("repulsao")


func _on_botaoatracao_pressed():
	verificar_resposta("atracao")
	
	
	

func reiniciar_desafio():
	desafio_concluido = false
	# Volta os botões para a aparência normal
	botao_atracao.modulate = Color.WHITE
	botao_repulsao.modulate = Color.WHITE

	# Limpa a mensagem de resultado
	resultado.text = "Escolha uma resposta!"


	


func _on_botaoreiniciar_pressed():
		reiniciar_desafio()
