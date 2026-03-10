extends Node

@onready var wigs_holder: Control = $ClothingBody/WigsHolder

@onready var wigs_shelf: HBoxContainer = $Cabinet/CabinetMargin/Shelves/Wigs/Carousel/Separator
@onready var tops_shelf: HBoxContainer = $Cabinet/CabinetMargin/Shelves/Tops/Carousel
@onready var pants_shelf: HBoxContainer = $Cabinet/CabinetMargin/Shelves/Pants/Carousel
@onready var shoes_shelf: HBoxContainer = $Cabinet/CabinetMargin/Shelves/Shoes/Carousel
@onready var accessories_shelf: HBoxContainer = $Cabinet/CabinetMargin/Shelves/Accessories/Carousel



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in wigs_shelf.get_children():
		child.clothing_selected.connect(change_clothing)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func change_clothing(name : String) -> bool:
	print("changing ", name)
	if name.begins_with("Wig"):
		for wig in wigs_holder.get_children():
			wig.visible = false
		wigs_holder.get_node(name).visible = true
	else:
		return false

	return true
