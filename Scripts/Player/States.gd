extends Node
class_name State

@export var can_move : bool = true
@export var has_dash : bool = true
@export var character : UniversalEntity
var playback : AnimationNodeStateMachinePlayback
var next_state : State

func dash():
	pass
	
func state_input(event):
	pass

func state_process(delta):
	pass
	
func on_enter():
	pass
	
func on_exit():
	pass
