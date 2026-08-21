extends Panel


@export var forcas: Node2D
@export var resultado: Label
@export var label_pontuacao: Label

var forca_alvo := 2.50
var desafio_concluido := false
var pontos := 0

var tentativas := 0
var tentativas_maximas := 3


func _process(_delta):

	if forcas == null:
		return

	if resultado == null:
		return

	var forca_atual = forcas.forca_atual


	# Mostra a força atual
	if not desafio_concluido:
		resultado.text = "FORÇA ATUAL: %.2f N" % forca_atual


	# Verifica a faixa do alvo
	if not desafio_concluido:

		if forca_atual >= 2.40 and forca_atual <= 2.60:

			desafio_concluido = true

			resultado.text = "✓ ALVO ATINGIDO! %.2f N" % forca_atual
			
			if label_pontuacao != null:

				var texto_atual = label_pontuacao.text
				var pontos_atuais = int(texto_atual.replace("PONTOS: ", ""))

				pontos_atuais += 10

				label_pontuacao.text = "PONTOS: " + str(pontos_atuais)


func reiniciar_desafio():
	if tentativas >= tentativas_maximas:
		resultado.text = "✗ FIM DAS TENTATIVAS!"
		return
		tentativas += 1
	desafio_concluido = false
	resultado.text = "TENTATIVA " + str(tentativas) + "/3"



func _on_button_pressed():
	reiniciar_desafio()
