extends Panel


@export var carga_positiva: Control
@export var valor_label: Label


func _on_botao_mais_pressed():
	carga_positiva.aumentar_carga()
	valor_label.text = str(carga_positiva.valor_carga) + " μC"


func _on_botao_menos_pressed():
	carga_positiva.diminuir_carga()
	valor_label.text = str(carga_positiva.valor_carga) + " μC"
