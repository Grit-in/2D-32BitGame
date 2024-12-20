extends State
class_name AttackState

@export_category("states")
@export var ground_state : GroundState
@export var air_state : AirState

@export_category("timers")
@export var ab : Timer#attack buffer
@export_range(0.1,2) var attack_timer := 0.4

@export_category("animations")
@export var attack_ground: String =  "attack"
@export var attack_air: String =  "air_attack"
@export var attack_follow: String =  "fattack"

func _ready():
	ab.wait_time = attack_timer

func state_input(event : InputEvent):
	if event.is_action_pressed("attack"):
		ab.start()
	
func _on_animation_tree_animation_finished(anim_name):
	if anim_name == attack_ground:
		if ab.is_stopped():
			next_state = ground_state
			playback.travel("move")
		else:
			playback.travel(attack_follow)
	elif anim_name == attack_follow:
		next_state = ground_state
		playback.travel("move")
	elif anim_name == attack_air:
		next_state = air_state
