extends Node

@onready var background: ColorRect = $Background

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("intro")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_dialogic_signal(argument:String):
	var activation_words = "show_intro_characters"
	if argument == activation_words:
		var tween = get_tree().create_tween()
		var duration = 0.6
		tween.tween_property(background, "color", Color.WHITE, duration)
		await tween.finished
	else:
		print("Something else aside from ", activation_words, " was activated!")


func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	Messenger.change_scene("LEVEL_OUTSIDE")
