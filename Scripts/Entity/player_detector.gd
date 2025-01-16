extends Area2D

@export var sm : EnemyStateMachine
@export var follow_state : FollowState
@export var roam_state : RoamState

func _on_body_entered(body):
	sm.on_state_interrupt_state(follow_state)


func _on_body_exited(body):
	sm.on_state_interrupt_state(roam_state)
