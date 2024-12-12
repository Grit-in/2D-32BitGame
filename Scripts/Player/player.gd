class_name Player
extends UniversalEntity



@export_category("move_vars")
@export_range(0,100,1,"or_greater") var speed := 100.0
@export var acceleration := 700
@export var friction := 900

@export_category("jump_vars")
@export_range(0,100,1,"or_greater") var jump_strength := 230
var jumped := false
var dash := false
@export var dash_distance := 300
@export_range(0.1,2) var dash_cooldown := 1.5
@export_range(0.1,2) var coyote_timer := 0.15
@export_range(0.1,2) var jump_buffer := 0.2
var can_move := true
var jump_count := 0
var isAttacking : bool = false


func _ready():
	$Timers/Coyote.wait_time = coyote_timer
	$Timers/JumpBuffer.wait_time = jump_buffer
	$Timers/DashCooldown.wait_time = dash_cooldown
	
func get_current_state() -> State:
	return current_state

	
func get_jump() -> bool:
	return jumped
	
func is_Attacking() -> bool:
	return isAttacking
	
# delta is the current frame time aka at 30FPS ≈ 1/30 ≈ 0.0333s etc.
func _physics_process(delta: float) -> void:
	RenderingServer.set_default_clear_color(Color.SKY_BLUE)
	
	
	if direction.x == 0 and is_on_floor():
		current_state = State.IDLE
		
	_apply_gravity(delta)
	# Player movement for left and rightd
	if direction.x:
		velocity.x = move_toward(velocity.x, direction.x * speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
		
	var on_floor = is_on_floor()
	
	move_and_slide()
	
	if on_floor and not is_on_floor() and velocity.y >= 0:
		$Timers/Coyote.start()
		
## Checks if a jump is possible
func try_jump():
	if is_on_floor() or $Timers/Coyote.time_left:
		
		_jump()
		jumped = false
	elif not is_on_floor() and velocity.y > 0:
		
		$Timers/JumpBuffer.start()
		
	jumped = true
	
## Executes a jump
func _jump():
	if jumped or $Timers/Coyote.time_left and is_on_floor():
		velocity.y = -jump_strength
		jumped = true
		
## Checks if a jump is possible
func try_dash():
	if velocity.x and not $Timers/DashCooldown.time_left:
		dash = true
		$Timers/DashCooldown.start()
		_dash()
	
func _dash():
	if dash:
		dash = false
		# create tween is like a move_towards function makes player move towards a direction
		var dash_tween = create_tween()
		
		#velocity.x + direction.x * dash_distance makes player dash to the predicted location of his x velocity
		dash_tween.tween_property(self,'velocity:x',velocity.x + direction.x * 600,0.3)
		dash_tween.connect("finished",on_dash_finish)
		gravity_multiplier = 0 #disable gravity during a dash
	
#stops player during dash	
func on_dash_finish():
	velocity.x = move_toward(velocity.x,0,500)
	gravity_multiplier = 1
	
func try_attack():
	isAttacking = true
