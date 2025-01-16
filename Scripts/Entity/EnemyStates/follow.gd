class_name FollowState
extends State

@export var floorcast : RayCast2D
@export var anim : Sprite2D
@export var playercast : RayCast2D
@export var follow_speed : int = 50
@export var roaming_state : RoamState
@onready var players = get_tree().get_nodes_in_group("Players")
@onready var player : Player

func _ready():
	for e in players:
		player = e
		
func on_enter():
	pass

func _physics_process(delta):
		var direction = (player.position - character.position).normalized()
		direction = sign(direction)
		if direction.x == 1:
			anim.flip_h = true
		else:
			anim.flip_h = false
			
func _on_player_detector_body_exited(body):
	if body is Player:
		next_state = roaming_state
