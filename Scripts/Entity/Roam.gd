extends EnemyState
class_name RoamState

@export_category("State")
@export var chase_state : ChaseState
@export var attack_state : EnemyAttackState

@export var speed : float = 200


func on_enter():
	print("kurac")
