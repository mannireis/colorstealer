extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"


func action() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
