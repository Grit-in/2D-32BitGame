class_name PlayerInput
extends Node

@export var character : UniversalEntity
@export var actions : PlayerInputActions
enum State {IDLE,WALK,JUMP,DASH,ATTACK}

func _process(_delta: float) -> void:
	
	character.direction = Input.get_vector(actions.left,actions.right,actions.jump,actions.down)
	
	
	#if you hold jump
	if Input.is_action_pressed(actions.jump):
		character.current_state = character.State.JUMP
		character.state_changed.emit(character.current_state)
		character.try_jump()
	
	if Input.is_action_pressed(actions.left) or Input.is_action_pressed(actions.right):
		character.current_state = character.State.WALK
		character.state_changed.emit(character.current_state)
		character.direction_changed.emit(character.direction)

# Function for calling player functions on click
func _unhandled_input(event: InputEvent) -> void:
	
	#if you tap jump
	if event.is_action_pressed(actions.jump):
		character.current_state = character.State.JUMP
		character.state_changed.emit(character.current_state)
		character.try_jump()
		
	if event.is_action_pressed(actions.dash):
		character.current_state = character.State.DASH
		character.state_changed.emit(character.current_state)
		character.try_dash()
		
	if event.is_action_pressed(actions.attack):
		character.current_state = character.State.ATTACK
		character.state_changed.emit(character.current_state)
		character.try_attack()
		
		
