extends Control


@onready var particulas = $Visor/Particulas
@onready var indicador = $IndicadorAumento
@onready var particulas_balao = $Visor/Particulasbalao
@onready var particulas_cabelo = $Visor/Particulascabelo
@onready var material_selecionado = $Materiaisanalise
@onready var botao_atritar = $Botaoatritar


func _ready():

	indicador.text = "AMPLIAÇÃO: 100×"




func _on_botao_100_pressed():
	indicador.text = "AMPLIAÇÃO: 100×"
	particulas.scale = Vector2(0.6, 0.6)
	particulas_balao.scale = Vector2(0.6, 0.6)
	particulas_cabelo.scale = Vector2(0.6, 0.6)


func _on_botao_1000_pressed():
	indicador.text = "AMPLIAÇÃO: 1.000×"
	particulas.scale = Vector2(1.0, 1.0)
	particulas_balao.scale = Vector2(1.0, 1.0)
	particulas_cabelo.scale = Vector2(1.0, 1.0)


func _on_button_10000_pressed():
	indicador.text = "AMPLIAÇÃO: 10.000×"
	particulas.scale = Vector2(1.5, 1.5)
	particulas_balao.scale = Vector2(1.5, 1.5)
	particulas_cabelo.scale = Vector2(1.5, 1.5)


func _on_balao_pressed():
	particulas.visible = false
	particulas_balao.visible = true
	particulas_cabelo.visible = false
	
	material_selecionado.text = "MATERIAL: BALÃO"
	
	


func _on_cabelo_pressed():
	particulas.visible = false
	particulas_balao.visible = false
	particulas_cabelo.visible = true

	material_selecionado.text = "MATERIAL: CABELO"


func _on_botaoatritar_pressed():
	if not particulas_balao.visible:
		return

	particulas_balao.ficar_carregado()
	particulas_cabelo.ficar_carregado()
