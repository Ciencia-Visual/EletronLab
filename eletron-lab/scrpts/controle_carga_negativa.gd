extends Panel


@export var carga_negativa: Control
@export var valor_label: Label

func _on_botao_mais_pressed():
	carga_negativa.aumentar_carga()
	valor_label.text = str(carga_negativa.valor_carga) + " μC"


func _on_botao_menos_pressed():
		carga_negativa.diminuir_carga()
		valor_label.text = str(carga_negativa.valor_carga) + " μC"
