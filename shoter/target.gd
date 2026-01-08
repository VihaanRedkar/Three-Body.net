extends CharacterBody2D

@export var speed := 40.0
var direction := Vector2.ZERO
var change_timer := 0.0

func _physics_process(delta):
	change_timer -= delta
	if change_timer <= 0:
		direction = Vector2(randf() * 2 - 1, randf() * 2 - 1).normalized()
		change_timer = randf_range(0.5, 2.0)

	velocity = direction * speed
	move_and_slide()

func hit():
	queue_free()
