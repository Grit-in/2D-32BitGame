class_name UniversalEntity
extends CharacterBody2D
enum State {IDLE,WALK,JUMP,DASH,ATTACK}

signal direction_changed(direction : Vector2)
signal state_changed(action : State)

@export var gravity := 600
@export var terminal_velocity := 500
var gravity_multiplier := 1

var direction : Vector2 : 
	set(value):
		if direction == value:
			return
		direction = value
		direction_changed.emit(direction)

var current_state : State :
	set(value):
		if current_state == value:
			return
		print_debug(State.keys()[value])
		current_state = value
		state_changed.emit(current_state)

func _apply_gravity(delta : float):
	velocity.y += gravity * delta
	velocity.y = velocity.y * gravity_multiplier
	velocity.y = min(velocity.y, terminal_velocity)
	
