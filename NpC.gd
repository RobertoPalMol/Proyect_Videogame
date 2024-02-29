extends Area2D

var estus : int = 5

func _on_body_entered(body):
	#cuando entra en el cuerpo muestra el dialogo 1 vez
	if Dialogic.current_timeline != null:
		return
	
	Dialogic.start('FerrotFirstDialog')
	get_viewport().set_input_as_handled()
	#cuando el player entra en contacto con el npc actualiza la variable estus en el resto de scripts
	var monster = get_tree().get_nodes_in_group("monster")[0]
	monster.mostrar(estus)
	var player = get_tree().get_nodes_in_group("player")[0]
	player.giveEstus(estus)
	
	
func _on_body_exited(body):
	#cuando el personaje sale de la hitbox se cierra el dialogo
	Dialogic.end_timeline()
