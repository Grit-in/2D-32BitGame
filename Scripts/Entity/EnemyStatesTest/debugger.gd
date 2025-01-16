extends Label

@export var chst : StateMachineEnemy
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = "State : " + chst.current_state.name
