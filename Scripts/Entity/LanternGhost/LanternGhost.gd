extends CharacterBody2D

@onready var player_cast : RayCast2D = $RayCastPlayer
@onready var debugger : Label = $Debugger
@onready var players = get_tree().get_nodes_in_group("Players")
@onready var player : Player

var direction = Vector2.RIGHT

func _ready():
	for e in players:
		player = e
	$Animation/AnimationTree.active = false

func _physics_process(_delta: float) -> void:
	direction  = (player.position - self.global_position).normalized()
	player_cast.target_position = direction * 50
	move_and_slide()
