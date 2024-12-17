extends State
class_name StunedState

@export var landing_animation_name : String =  "jump_end"
@export var ground_state : GroundState

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == landing_animation_name:
		next_state = ground_state
