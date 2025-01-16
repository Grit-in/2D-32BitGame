extends Node
class_name EnemyHurtBox

signal on_hit(node : Node,dmg_taken : int)

var playback : AnimationNodeStateMachinePlayback
@export var animation_tree : AnimationTree
@export var anim : AnimationPlayer

@export var health : float = 200 : 
	get:
		return health
	set(value):
		SignalHp.emit_signal("on_health_changed", get_parent(),value - health)
		health = value
		
func hit(damage : int):
	health -= damage
	emit_signal("on_hit",get_parent(),damage)
