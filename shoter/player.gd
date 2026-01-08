extends CharacterBody2D

@export var speed := 250.0
@export var bullet_scene: PackedScene

func _physics_process(delta):
	# Movement
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	velocity = input_vector * speed
	move_and_slide()

	# Aim at mouse
	look_at(get_global_mouse_position())

func _input(event):
	if event.is_action_pressed("SHOOT"):
		shoot()

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position
	bullet.rotation = rotation
	get_tree().current_scene.add_child(bullet)
