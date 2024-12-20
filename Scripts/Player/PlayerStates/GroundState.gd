extends State
class_name GroundState

var player : Player
var pinput : PlayerInputStateMachine
@export_category("jump_vars")
@export_range(0,100,1,"or_greater") var jump_strength := 230
var jumped := false

@export_category("State")
@export var air_state : AirState
@export var attack_state : AttackState


@export_category("timers")
@export var ct : Timer
@export var dcd : Timer
@export_range(0.1,2) var coyote_timer := 0.15
@export_range(0.1,2) var dash_timer := 0.75

@export_category("animation_vars")
@export var jump_animation : String = "jump"
@export var dash_animation : String = "dash"
@export var attack_animation : String = "attack"
@export var falling_animation : String = "falling"
	
func _ready():
	ct.wait_time = coyote_timer
	dcd.wait_time = dash_timer
	
func state_process(_delta):
	if !character.is_on_floor():
		ct.start()

func state_input(event : InputEvent):
	if event.is_action_pressed("move_jump"):
		_jump()
	elif event.is_action_pressed("dash"):
		dash()
	elif event.is_action_pressed("attack"):
		attack()
		
func attack():
	next_state = attack_state
	playback.travel(attack_animation)
	
## Executes a jump
func _jump():
	character.velocity.y = -jump_strength
	next_state = air_state
	playback.travel(jump_animation)

func dash():
	if has_dash:
		has_dash = false
		dcd.start()
		var dash_tween = create_tween()
		#velocity.x + direction.x * dash_distance makes player dash to the predicted location of his x velocity
		dash_tween.tween_property(self,'character:velocity:x',character.velocity.x + character.direction.x * 600,0.3)
		dash_tween.connect("finished",on_dash_finish)
		playback.travel(dash_animation)
		character.gravity_multiplier = 0

func on_dash_finish():
	character.gravity_multiplier = 1
	character.velocity.x = move_toward(character.velocity.x,0,500)
	
##gives player more time to jump if ct runs out swaps to falling
func _on_coyote_timeout():
	playback.travel(falling_animation)
	next_state = air_state

##after dash cd is back it resets both air and ground dash 
func _on_dash_cooldown_timeout():
	has_dash = true
	air_state.has_dash = true
