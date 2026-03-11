extends Node

const LEVEL_DRESSUP = preload("res://scenes/levels/level_dressup.tscn")
const LEVEL_OUTSIDE = preload("res://scenes/levels/level_outside.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Messenger.change_level.connect(change_level)
	var buildings = get_tree().get_nodes_in_group("enterable building")
	for b in buildings:
		b.change_to_next_level.connect(change_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_R) and Messenger.debug:
		get_tree().reload_current_scene()

func change_level(next_scene) -> void:
	print("changing level in main to ", Messenger.next_scene_str)
	#TODO transition cover
	for child in get_children():
		if child.name.begins_with("Level"):
			var new_level = get(next_scene).instantiate()
			child.add_sibling(new_level)
			child.queue_free()
			break
	#TODO remove transition
