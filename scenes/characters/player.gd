extends CharacterBody2D

@onready var sprite_day: AnimatedSprite2D = $Sprites/Day
@onready var sprite_night: AnimatedSprite2D = $Sprites/Night

const SPEED = 125.0
const JUMP_VELOCITY = -400.0

var current_house_hovered : Node2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.x > 0:
			sprite_day.play("walk_right")
			sprite_night.play("walk_right")
		else:
			sprite_day.play("walk_left")
			sprite_night.play("walk_left")
	else: #ie not moving
		if sprite_day.animation == "walk_right":
			sprite_day.play("idle_right")
			sprite_night.play("idle_right")
		elif sprite_day.animation == "walk_left":
			sprite_day.play("idle_left")
			sprite_night.play("idle_left")


		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
