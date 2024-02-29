extends Control

@onready var sprite := $AnimatedSprite2D

func _ready():
	sprite.play("Default")
	#Cuando inicia el juego se muestra automaticamente

func _process(delta):
	#cuando haces click desaparece
	if Input.is_action_just_pressed("click"):
		queue_free()
