extends Label

@export var chst : EnemyStateMachine

func _process(_delta):
	text = "State : " + chst.current_state.name
