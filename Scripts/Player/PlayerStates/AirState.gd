extends State
class_name AirState

@export_category("State")
@export var ground_state : GroundState
@export var attack_state : AttackState

#double jump velocity
@export var double_jumpv : float = -200

var has_double_jump : bool = false
var has_dashed : bool = false
var jump_buffered : bool = false

@export_category("timers")
@export var dcd : Timer
@export_range(0.1,2) var dash_timer := 0.75
@export var jb : Timer
@export_range(0.1,2) var jump_buffer := 0.2

@export_category("animation_vars")
@export var landing_animation : String = "jump_end"
@export var djump_animation : String = "double_jump"
@export var dash_animation : String = "dash"
@export var attack_animation : String = "attack"

func _ready():
	jb.wait_time = jump_buffer
	
func on_exit():
	if next_state == ground_state :
		playback.travel(landing_animation)
		has_double_jump = false

func state_input(event : InputEvent):
	if event.is_action_pressed("move_jump") and has_double_jump:
		double_jump()
	elif event.is_action_pressed("dash") and has_dash:
		dash()
	elif event.is_action_pressed("attack"):
		attack()

func attack():
	next_state = attack_state
	playback.travel(attack_animation)
	
func double_jump():
	character.velocity.y = double_jumpv
	playback.travel(djump_animation)
	has_double_jump = false

func dash():
	if has_dash:
		has_dash = false
		has_double_jump = true
		dcd.start()
		var dash_tween = create_tween()
		
		#velocity.x + direction.x * dash_distance makes player dash to the predicted location of his x velocity
		dash_tween.tween_property(self,'character:velocity:x',character.velocity.x + character.direction.x * 600,0.3)
		playback.travel(dash_animation)
		dash_tween.connect("finished",on_dash_finish)
		character.gravity_multiplier = 0

func on_dash_finish():
	character.gravity_multiplier = 1
	character.velocity.x = move_toward(character.velocity.x,0,500)
	if not character.is_on_floor():
		print(playback.get_current_node())
		playback.travel("falling")
		
func state_process(_delta):
	if character.is_on_floor():
		next_state = ground_state

func _on_dash_cooldown_timeout():
	has_dash = true
	ground_state.has_dash = true
