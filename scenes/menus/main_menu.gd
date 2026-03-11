extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	print("going")
	Messenger.change_scene("LEVEL_OUTSIDE")


func _on_tutorial_button_pressed() -> void:
	pass # Replace with function body.


func _on_quit_button_pressed() -> void:
	pass # Replace with function body.
