extends Node

class_name Damageble

@export var health : float = 10 :
	get:
		return health
	set(value):
		Signalbus.emit_signal("on_health_changed", get_parent(), value - health)
		health = value

func hit(damage : int):
	health -= damage
	
	if(health <0):
		get_parent().queue_free()
