extends Node2D
class_name StateMachineEnemy

var current_state : EnemyState
var last_state : EnemyState

func _ready():
	current_state = get_child(0) as EnemyState
	last_state = current_state
	current_state.on_enter() 

func change_state(state):
	current_state = find_child(state) as EnemyState
	current_state.on_enter()
	
	last_state.on_exit()
	last_state = current_state


func _on_lantern_sight_body_entered(body):
	change_state("Follow")


func _on_lantern_sight_body_exited(body):
	print("huh")
	change_state("Idle")
