extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Messenger.change_level.connect(change_level)
	var buildings = get_tree().get_nodes_in_group("enterable building")
	for b in buildings:
		b.change_to_next_level.connect(change_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_level(next_level) -> void:
	print("changing level in main to ", next_level)
