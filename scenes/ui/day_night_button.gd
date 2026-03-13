extends Button

#@onready var night_filter: ColorRect = $NightFilter
signal change_day_and_night

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	print("change day/night")
	if Dialogic.VAR.day_night_cycle == "day":
		Dialogic.VAR.day_night_cycle = "night"
	elif Dialogic.VAR.day_night_cycle == "night":
		Dialogic.VAR.day_night_cycle = "day"

	change_day_and_night.emit()
	get_tree().call_group("day_cycle", "swap_cycle")
