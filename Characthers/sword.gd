extends Area2D

@export var damage : int = 10

func _ready() -> void:
	monitoring = false

func _on_body_entered(body: Node2D) -> void:
	for child in body.get_children():
		if child is Damageble:
			child.hit(damage)
