class_name PlayerInput
extends Node

@export var character : UniversalEntity
@export var actions : PlayerInputActions

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	character.direction = Input.get_vector(actions.left,actions.right,actions.jump,actions.down)
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(actions.jump):
		character.try_jump()
