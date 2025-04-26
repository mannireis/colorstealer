extends Node

@export var hearts : Array[Node]

var lives = 3

func decrease():
	lives -= 1
	print(lives)
	for h in 3:
		if (h < lives):
			hearts[h].show()
		else:
			hearts[h].show()
	if (lives == 0):
		get_tree().reload_current_scene()
	
