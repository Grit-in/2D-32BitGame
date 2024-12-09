class_name EntityAnimation
extends Node2D

var last_direction = 1
@export var character : UniversalEntity : 
	set(value):
		if is_instance_valid(character):
			character.direction_changed.disconnect(on_direction_changed)
			
		character = value
		
		if is_instance_valid(character):
			character.direction_changed.connect(on_direction_changed)

func on_direction_changed(c_direction : Vector2):
	if c_direction.x == 0:
		if last_direction > 0:
			$PlayerSprite2D.play("Idle")
		else:
			$PlayerSprite2D.play("IdleLeft")
		return
	if c_direction.x > 0:
		last_direction = c_direction.x
		$PlayerSprite2D.play("Walk")
	else:
		last_direction = c_direction.x
		$PlayerSprite2D.play("WalkLeft")
