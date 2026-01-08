extends Area2D

@export var speed := 600.0

func _physics_process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta

func _on_body_entered(body):
	if body.is_in_group("target"):
		body.hit()
	queue_free()
