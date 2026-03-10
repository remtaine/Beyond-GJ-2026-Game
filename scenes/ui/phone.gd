extends Control

var phone_visible := false
var phone_movement := 400

@onready var phone_list: ColorRect = $PhoneList

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_phone_appear_button_pressed() -> void:
	#if not phone_visible:
		#phone_list.position.x -= phone_movement
	#else:
		#phone_list.position.x += phone_movement

	phone_list.visible = not phone_list.visible
