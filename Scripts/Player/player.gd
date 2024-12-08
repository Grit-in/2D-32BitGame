extends CharacterBody2D



@export var speed := 200
var last_direction = 0
var gravity = 1000
@onready var cayote_timer = $CoyoteTimer
var canCT = false # can player use cayote time
var can_move := true
var direction := Vector2.ZERO#beggining pos
@export var jump_velocity := 300
@export var movAcceleration := 500
@export var friction := 800

# delta is the current frame time aka at 30FPS ≈ 1/30 ≈ 0.0333s
func _physics_process(delta: float) -> void:
	if can_move:
		get_curr_input()
		apply_movement(delta)
		apply_jump(delta)
		move_and_slide()
		
func get_curr_input():
	direction.x = Input.get_axis("move_left","move_right")
	
func apply_movement(delta):
	if direction.x:
		print(velocity.x)
		velocity.x = move_toward(velocity.x,direction.x * speed, delta * movAcceleration)
	else:
		print(velocity.x)
		velocity.x = move_toward(velocity.x,0,delta * friction)
		
	if direction.x != 0:
		last_direction = direction.x
		play_walk_animation(last_direction)
	else:
		play_idle_animation(last_direction)
	
#Function for jump modifications and cayote time
func apply_jump(delta):
	
	if not is_on_floor() and canCT == false:
		velocity.y += gravity * delta
		if velocity.y > 1000:
			velocity.y = 500
		
	#IF on egde of a platform gives a player 1s to jump after sliding of it
	if Input.is_action_just_pressed("move_jump"):
		if is_on_floor() || canCT:
			velocity.y = -jump_velocity
			if canCT:
				canCT = false
				
	var was_on_floor = is_on_floor()
	if was_on_floor and not is_on_floor() and velocity.y >= 0:
		canCT = true
		cayote_timer.start()
		print("Fall")
	
#Here goes any other animation mv changes
func play_walk_animation(direction):
	if direction > 0:
		$AnimatedSprite2D.play("Walk")
	elif direction < 0:
		$AnimatedSprite2D.play("WalkLeft")
		
#Idle animation if left set left if not set right
func play_idle_animation(direction):
	if direction > 0:
		$AnimatedSprite2D.play("Idle")
	elif direction < 0:
		$AnimatedSprite2D.play("IdleLeft")


func _on_coyote_timer_timeout() -> void:
	canCT = false
