class_name UniversalEntity
extends CharacterBody2D

signal direction_changed(direction : Vector2)

var direction : Vector2 : 
	set(value):
		if direction == value:
			return
		direction = value
		direction_changed.emit(direction)

func _apply_gravity(delta : float):
	var gravity = get_gravity()
	velocity.x += gravity.x * delta
	if velocity.y > 100:
		velocity.y = 100
	velocity.y += gravity.y * delta
