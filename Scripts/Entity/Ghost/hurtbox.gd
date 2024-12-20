extends Node
class_name HurtBoxEnemy

@export var health : float = 120

func hit(demage : int):
	health -= demage
	
	if(health <= 0):
		get_parent().queue_free()
