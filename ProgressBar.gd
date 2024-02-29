extends ProgressBar

var valormax : int
var damage : int

func _ready():
	#cuando empieza el juego tiene la vida maxima '100'
	valormax = 100



func DisminuirVida(damage):
	#cuando recibe daño le baja la vida dependiendo de la variable obtenida
	value -= damage
	#si la vida es menor que 0, activa la funcion muerte
	if value <= 0:	
		get_tree().get_nodes_in_group("player")[0].dead()
	

func AugmentarVida(health):
	#sube la vida dependiendo de la variable recibida
	value += health
	
