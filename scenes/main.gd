extends Node

const LEVEL_DRESSUP = preload("res://scenes/levels/level_dressup.tscn")
const LEVEL_OUTSIDE = preload("res://scenes/levels/level_outside.tscn")
const LEVEL_INTRO = preload("res://scenes/levels/level_intro.tscn")

const POPUP_MINIGAME = preload("res://scenes/levels/popup_minigame.tscn")

@onready var transition_cover: ColorRect = $TransitionLayer/Transition

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Messenger.change_level.connect(change_level)
	var buildings = get_tree().get_nodes_in_group("enterable building")
	for b in buildings:
		b.change_to_next_level.connect(change_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_level(next_scene) -> void:
	print("changing level in main to ", Messenger.next_scene_str)

	#I have no idea why this doesn't work in a function
	var tween = get_tree().create_tween()
	var duration = 0.6
	tween.tween_property(transition_cover, "color:a", 1.0, duration)
	await tween.finished

	if next_scene.begins_with("LEVEL"):
		for child in get_children():
			if child.name.begins_with("Level"):
				var new_level = get(next_scene).instantiate()
				child.add_sibling(new_level)
				child.queue_free()
				break
	elif next_scene.begins_with("POPUP"):
		pass

	#same here
	tween = get_tree().create_tween()
	tween.tween_property(transition_cover, "color:a", 0.0, duration)
	await tween.finished

func animate_transition(forward := true) -> void:
	#doesn't woooork
	var tween =get_tree().create_tween()
	var duration = 0.4
	if forward:
		tween.tween_property(transition_cover, "color:a", 1.0, duration)
		await tween.finished
	else:
		tween.tween_property(transition_cover, "color:a", 0.0, duration)
		await tween.finished
