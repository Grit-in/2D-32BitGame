extends EnemyState
class_name EnemyStunState

@export var hurtbox : HurtBoxEnemy
@export var Smachine : EnemyStateMachine
@export var death_state : EnemyDeathState

func on_enter():
	pass
	
func _ready():
	hurtbox.connect("on_hit",on_hurtbox_hit)

func on_hurtbox_hit(node : Node,dmg : int):
	if(hurtbox.health > 0):
		emit_signal("interrupt_state",self)
	else:
		emit_signal("interrupt_state",death_state)
