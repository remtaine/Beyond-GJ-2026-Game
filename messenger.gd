extends Node

var next_scene_str : String
signal change_level(next_level_str)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_scene() -> void:
	change_level.emit()
