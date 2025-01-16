extends EnemyState
class_name EnemyAttackTest

@export var bullet_node : PackedScene
@onready var timer = $BulletTimer

func on_enter():
	print("usao u attack")
	super.on_enter()
	timer.start()
	
func on_exit():
	super.on_exit()
	timer.stop()
	
func transition():
	if not player_cast.is_colliding():
		get_parent().change_state("Follow")

func _on_bullet_timer_timeout():
	shoot()
	
func shoot():
	print("shoot")
	var bullet = bullet_node.instantiate()
	bullet.position = global_position
	bullet.direction = (player.global_position - self.global_position).normalized()
	get_tree().current_scene.call_deferred("add_child",bullet)
