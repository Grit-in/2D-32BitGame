class_name UniversalEntity
extends CharacterBody2D


@export var gravity := 600
@export var terminal_velocity := 500
var gravity_multiplier := 1


func _apply_gravity(delta : float):
	velocity.y += gravity * delta
	velocity.y = velocity.y * gravity_multiplier
	velocity.y = min(velocity.y, terminal_velocity)
	
