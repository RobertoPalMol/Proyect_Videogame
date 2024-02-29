extends CharacterBody2D

var velocidad : int = 50
var vel_perseguir : int = 70
@onready var sprite := $AnimatedSprite2D
var perseguir : bool = false
var atack : bool = false

func _ready():
	#cuando inicia el juego el enemigo empieza a deambular 
	velocity.x = velocidad
	sprite.play("Run")
	
func _physics_process(delta):
	
	detectar()
	#si perseguir es falso ejectua lo siguiente
	if !perseguir:
		#si toca una pared cambia de direccion 
		if is_on_wall():
			if sprite.flip_h:
				velocity.x = velocidad
				$Area2D.position.x = 0
			else:
				velocity.x = -velocidad
				$Area2D.position.x = -22
		if velocity.x < 0:
			sprite.flip_h = true
		elif velocity.x > 0:
			sprite.flip_h = false
	move_and_slide()


func detectar():
	#si el elemento detecta algun objeto perteneciente al grupo 'player', empieza a perseguirlo
	if $right.is_colliding():
		var obj = $right.get_collider()
		if obj.is_in_group("player"):
			perseguir = true
			velocity.x = vel_perseguir
			$Area2D.position.x = 0
			sprite.flip_h = false
		else:
			perseguir = false
	
	
	if $left.is_colliding():
		var obj = $left.get_collider()
		if obj.is_in_group("player"):
			perseguir = true
			velocity.x = -vel_perseguir
			$Area2D.position.x = -22
			sprite.flip_h = true
		else:
			perseguir = false
			
func attack():
	#cuando se activa la funcion atacar para su movimiento y hace la animacion de atacar
	set_physics_process(false)
	sprite.play("Attack")
	#hay un timeout porque el 'await sprite.animation_finished' no funciona
	await get_tree().create_timer(0.5).timeout
	#vuleve a activar su movimineto y vuelve a caminar
	set_physics_process(true)
	sprite.play("Run")
	
			
func _on_area_2d_body_entered(body):
	#cuando un objeto del grupo player entra en el cuerpo activa la funcion de atacar y envia la funcion golpe a el player
	if body.is_in_group("player"):
		attack()
		body.hit()

	
func dead():
	#cuando muere se desactiva su movimiento y hace la animacion de muerte
	set_physics_process(false)
	sprite.play("Death")
	await get_tree().create_timer(1).timeout
	#desaparece de la escena
	queue_free()
