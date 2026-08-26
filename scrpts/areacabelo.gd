extends Area2D


var balao_dentro := false


func _ready():

	area_entered.connect(_quando_entrar)
	area_exited.connect(_quando_sair)


func _quando_entrar(area):

	if area.name == "Areabalao":

		balao_dentro = true


func _quando_sair(area):

	if area.name == "Areabalao":

		balao_dentro = false
