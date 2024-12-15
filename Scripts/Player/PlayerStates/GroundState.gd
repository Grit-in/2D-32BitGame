extends State
class_name GroundState

var player : Player

@export_category("jump_vars")
@export_range(0,100,1,"or_greater") var jump_strength := 230
var jumped := false
@export var air_state : AirState
@export var jump_animation : String = "jump"
@onready var ct : Timer = $"../$Timers/Coyote"

func state_process(_delta):
	if !character.is_on_floor():
		next_state = air_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("move_jump")):
		_jump()

	
## Executes a jump
func _jump():
	character.velocity.y = -jump_strength
	next_state = air_state
	playback.travel(jump_animation)
