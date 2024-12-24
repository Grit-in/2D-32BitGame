extends UniversalEntity
class_name GhostYokai

@export_category("move_vars")
@export_range(0,100,1,"or_greater") var speed := 100.0
@export var acceleration := 700
@export var friction := 900

@onready var animation_tree : AnimationTree = $Animation/AnimationTree
@onready var sprite : Sprite2D = $Animation/Sprite2D

func _ready():
	
	animation_tree.active = true
	
func _physics_process(delta):
	_apply_gravity(delta)
	move_and_slide()
	if $Animation/RayCastPlayer.is_colliding():
		velocity.x = -velocity.x
		$Animation.scale.x = -$Animation.scale.x
		
