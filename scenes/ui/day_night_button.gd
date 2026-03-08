extends Button

@onready var night_filter: ColorRect = $NightFilter


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	print("pressed")
	night_filter.visible = not night_filter.visible
