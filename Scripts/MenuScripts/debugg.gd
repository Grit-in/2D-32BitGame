extends Label

@export var chst : PlayerInputStateMachine
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "State : " + chst.current_state.name
