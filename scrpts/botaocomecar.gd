extends Button

@onready var anim = $"../AnimationPlayer"

func _ready():
	mouse_entered.connect(_mouse_entrou)
	mouse_exited.connect(_mouse_saiu)

func _mouse_entrou():
	anim.play("BotaoHover")

func _mouse_saiu():
	anim.play_backwards("BotaoHover")


func _on_pressed():
	get_tree().change_scene_to_file("res://cenas/laboratorio.tscn")
