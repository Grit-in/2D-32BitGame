extends State
class_name RoamState

@export var floorcast : RayCast2D
@export var anim : Node2D
@export var follow_state : FollowState

func on_enter():
	playback.travel("walk")

func state_process(_delta):
	pass
	#if not floorcast.is_colliding():
		#character.direction = -character.direction
		#anim.scale.x = -anim.scale.x


func _on_player_detector_body_entered(body):
	next_state = follow_state
