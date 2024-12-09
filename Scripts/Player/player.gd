class_name Player
extends UniversalEntity

@export_category("move_vars")
@export_range(0,100,1,"or_greater") var speed := 100.0
@export var acceleration := 700
@export var friction := 900

@export_category("jump_vars")
@export_range(0,100,1,"or_greater") var jump_strength := 300


# delta is the current frame time aka at 30FPS ≈ 1/30 ≈ 0.0333s etc.
func _physics_process(delta: float) -> void:
	
	
	# Player movement for left and right
	if direction.x:
		velocity.x = move_toward(velocity.x, direction.x * speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
	_apply_gravity(delta)
	move_and_slide()
	
## Checks if a jump is possible
func try_jump() -> bool:
	if is_on_floor():
		_jump()
		return true
		
	return false
	
## Executes a jump
func _jump():
	velocity.y = -jump_strength
	
