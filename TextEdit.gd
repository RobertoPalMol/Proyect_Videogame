extends TextEdit

var estus : int = 0

func _ready():
	#muestra 0 estus al inicio del juego
	$".".text = str(estus)

func mostrar(estus):
	#muestra los nuevos estus cada vez que se actualiza
	$".".text = str(estus)
