extends State
class_name EnemyStunState

@export var hurtbox : EnemyHurtBox
@export var death_state : EnemyDeathState
@export var last_state : State
@export var knock_back : Vector2 = Vector2(40,0)
@export var stun_timer : Timer

func _ready():
	hurtbox.connect("on_hit",on_hurtbox_hit)

func on_enter():
	character.velocity = knock_back

func on_exit():
	stun_timer.start()
func on_hurtbox_hit(node : Node,dmg : int):
	if(hurtbox.health > 0):
		emit_signal("interrupt_state",self)
	else:
		emit_signal("interrupt_state",death_state)


func _on_stun_timer_timeout():
	emit_signal("interrupt_state",last_state)
