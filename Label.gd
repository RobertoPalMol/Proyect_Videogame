extends Label

var estus : int = 0

func _ready():
	#muestra 0 estus al inicio del juego
	$".".text = str(estus)


func mostrar(estus):
	#cuando se actualiza la variable estus muestra el nuevo valor
	$".".text = str(estus)
