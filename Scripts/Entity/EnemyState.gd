extends Node
class_name EnemyState

@export var can_move : bool = true
@export var character : UniversalEntity
var playback : AnimationNodeStateMachinePlayback
var next_state : EnemyState

signal interrupt_state(new_state : EnemyState)

func physics_update(event):
	pass
	
func state_input(event):
	pass

func state_process(delta):
	pass
	
func on_enter():
	pass
	
func on_exit():
	pass
