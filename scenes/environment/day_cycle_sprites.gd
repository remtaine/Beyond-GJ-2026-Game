extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func swap_cycle() -> void:
	if get_child_count() != 2:
		pass
	else:
		$Day.visible = not $Day.visible
		$Night.visible = not $Night.visible
