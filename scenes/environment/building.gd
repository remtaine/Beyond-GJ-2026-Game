class_name Building
extends Area2D

#const LEVEL_DRESSUP = preload("res://scenes/levels/level_dressup.tscn")
#const LEVEL_DRESSUP = "res://scenes/levels/level_dressup.tscn"

signal change_to_next_level(next_level)

@export var next_level : PackedScene = null
@export var entry_dialogue : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("enterable")
	add_to_group("day_cycle")
	#Dialogic.signal_event.connect(_on_dialogic_signal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print("entered ", name)
	Dialogic.start(entry_dialogue)


func _on_body_exited(body: Node2D) -> void:
	Dialogic.end_timeline()


#func _on_dialogic_signal(argument:String):
	#if argument == "next_level":
		#pass
	#else:
		#print("Else was activated!")
