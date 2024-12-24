extends Node
class_name HurtBoxEnemy

signal on_hit(node : Node,dmg_taken : int)

@export var health : float = 120 : 
	get:
		return health
	set(value):
		SignalHp.emit_signal("on_health_changed", get_parent(),value - health)
		health = value

func hit(damage : int):
	health -= damage
	
	emit_signal("on_hit",get_parent(),damage)
