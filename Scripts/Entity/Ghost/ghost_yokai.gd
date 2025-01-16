extends UniversalEntity
class_name GhostYokai

@export_category("move_vars")
@export_range(0,100,1,"or_greater") var speed := 30.0
@export_range(0,100,1,"or_greater") var chase_speed := 40.0
@export var acceleration := 200
@export var friction := 900
@export var state_machine : EnemyStateMachine
@export var animation_tree : AnimationTree
@export var sprite : Sprite2D
@export var stun_state : EnemyStunState
@export var follow_state : FollowState
@export var death_state : EnemyDeathState

var last_dir : int

var direction : int = -1:
	get:
		return direction
	set(value):
		direction = value

signal detect()

func _ready():
	
	animation_tree.active = true
	
func _physics_process(delta):
	_apply_gravity(delta)
	if direction and state_machine.check_if_can_move():
		
		if state_machine.current_state != follow_state:
			velocity.x = direction * speed
			
		if state_machine.current_state == follow_state:
			velocity.x = direction * chase_speed
			
	elif state_machine.current_state == death_state:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	if not $Animation/RayCastFloor.is_colliding():
		direction = -direction
		$Animation.scale.x = -$Animation.scale.x
		
	move_and_slide()
		
