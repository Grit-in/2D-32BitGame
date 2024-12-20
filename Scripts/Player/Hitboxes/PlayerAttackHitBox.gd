extends Area2D

@export var melee_dmg : int = 50

func _on_body_entered(body):
	for child in body.get_children():
		if child is HurtBoxEnemy:
			child.hit(melee_dmg)
			
