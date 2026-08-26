extends Panel


@export var carga_geradora: Control

# Cores da carga
@export var cor_positiva: Color = Color(1.0, 0.05, 0.12, 1.0)
@export var cor_negativa: Color = Color(0.39, 0.49, 0.97, 1.0)

func definir_carga_positiva():

	if carga_geradora == null:
		return

	var modulo = abs(carga_geradora.valor_carga)

	carga_geradora.valor_carga = modulo

	carga_geradora.cor_carga = cor_positiva

	carga_geradora.queue_redraw()

func definir_carga_negativa():

	if carga_geradora == null:
		return

	var modulo = abs(carga_geradora.valor_carga)

	carga_geradora.valor_carga = -modulo

	carga_geradora.cor_carga = cor_negativa

	carga_geradora.queue_redraw()

func _on_cargapositiva_pressed():
		definir_carga_positiva()

func _on_carganegativa_pressed():
		definir_carga_negativa()
