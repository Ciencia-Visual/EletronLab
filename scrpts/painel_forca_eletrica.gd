extends Panel


@export var carga_positiva: Control
@export var carga_negativa: Control
@export var label_forca: Label



var k := 8.99e9


func _process(_delta):
	calcular_forca()


func calcular_forca():

	if carga_positiva == null or carga_negativa == null:
		return

	if label_forca == null:
		return


	var q1_micro = carga_positiva.valor_carga
	var q2_micro = carga_negativa.valor_carga

	# Conversão de μC para C
	var q1 = q1_micro * 0.000001
	var q2 = q2_micro * 0.000001

	var pos1 = (
		carga_positiva.global_position
		+ Vector2(70, 70)
	)

	var pos2 = (
		carga_negativa.global_position
		+ Vector2(70, 70)
	)

	var distancia_pixels = pos1.distance_to(pos2)

	if distancia_pixels < 1:
		return


	# 400 pixels = 0,40 metros
	var distancia_metros = distancia_pixels / 1000.0

	var forca = k * abs(q1 * q2) / pow(distancia_metros, 2)


	label_forca.text = "F = %.2f N" % forca
