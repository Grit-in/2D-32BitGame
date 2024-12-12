class_name EntityAnimation
extends Node2D

var last_direction = 1
enum State {IDLE,WALK,JUMP,DASH,ATTACK}
@export var current_state: State


@export var character : UniversalEntity : 
	set(value):
		if is_instance_valid(character):
			character.state_changed.disconnect(on_state_changed)
			character.direction_changed.disconnect(on_direction_changed)
			
		character = value
		
		if is_instance_valid(character):
			character.state_changed.connect(on_state_changed)
			character.direction_changed.connect(on_direction_changed)
			

func on_direction_changed(c_direction : Vector2):
		if c_direction.x:
			$PlayerSprite2D.flip_h = c_direction.x < 0

func on_state_changed(action : State):
	match action:
		State.IDLE:
			$PlayerSprite2D.play("Idle")
		State.WALK:
			$PlayerSprite2D.play("Walk")
		State.JUMP:
			$PlayerSprite2D.play("Jump")
		State.DASH:
			$PlayerSprite2D.play("Dash")
		State.ATTACK:
			if character.is_on_floor():
				$PlayerSprite2D.play("Attack")
			else:
				$PlayerSprite2D.play("AirAttack")
