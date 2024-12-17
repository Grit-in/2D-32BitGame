extends State
class_name AttackState

@export var attack_ground: String =  "attack"
@export var attack_air: String =  "air_attack"
@export var ground_state : GroundState
@export var air_state : AirState

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == attack_ground:
		next_state = ground_state
	elif anim_name == attack_air:
		next_state = air_state
