class_name Player
extends UniversalEntity



@export_category("move_vars")
@export_range(0,100,1,"or_greater") var speed := 100.0
@export var acceleration := 700
@export var friction := 900

@onready var animation_tree : AnimationTree = $Animations/AnimationTree
@onready var sprite : Sprite2D = $Animations/Sprite2D
@onready var state_machine : PlayerInputStateMachine =  $PlayerInput
@onready var hitbox : Marker2D = $HitboxMarker




@export_category("dash_vars")
var dash := false
@export var dash_distance := 300

var direction : Vector2 = Vector2.ZERO

func _ready():
	
	animation_tree.active = true
# delta is the current frame time aka at 30FPS ≈ 1/30 ≈ 0.0333s etc.
func _physics_process(delta: float) -> void:
	#BG COLOR
	RenderingServer.set_default_clear_color(Color.SKY_BLUE)
	
	_apply_gravity(delta)
	
	direction = Input.get_vector("move_left","move_right","move_jump","move_down")
	
	if direction.x != 0 && state_machine.check_if_can_move():
		velocity.x = move_toward(velocity.x, direction.x * speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
	
	
	move_and_slide()	
	update_animation_parameters()
	update_facing_side()
	

func update_facing_side():
	if direction.x >= 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
		
func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", direction.x)
