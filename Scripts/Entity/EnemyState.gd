extends Node2D
class_name EnemyState
#Abstract state class

@export var player_cast : RayCast2D
@export var debugger : Label
@onready var players = get_tree().get_nodes_in_group("Players")
@onready var player : Player
@export var character : CharacterBody2D

func _ready():
	for e in players:
		player = e
		
func on_enter():
	pass
	
func on_exit():
	pass

func transition():
	pass
	
func _physics_process(delta):
	transition()
