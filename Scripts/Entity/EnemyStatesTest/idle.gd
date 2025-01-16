extends EnemyState
class_name EnemyIdleTest

func on_enter():
	print("usao u idle")
	
func transition():
	if player_cast.is_colliding():
		get_parent().change_state("Attack")

	
