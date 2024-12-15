extends State
class_name AirState

@export var ground_state : GroundState
@export var landing_state : LandingState
@export var landing_animation : String = "jump_end"
@export var double_jumpv : float = -200#double jump velocity
@export var djump_animation : String = "double_jump"

var has_double_jumped : bool = false
var has_dashed : bool = false

func on_exit():
	if next_state == landing_state :
		playback.travel(landing_animation)
		has_double_jumped = false

func state_input(event : InputEvent):
	if event.is_action_pressed("move_jump") and not has_double_jumped:
		double_jump()
	elif event.is_action_pressed("dash") and not has_dashed:
		try_dash()
			
func double_jump():
	character.velocity.y = double_jumpv
	playback.travel(djump_animation)
	has_double_jumped = true

func try_dash():
		has_dashed = true
		#_dash()
		
func state_process(delta):
	if character.is_on_floor():
		next_state = landing_state
