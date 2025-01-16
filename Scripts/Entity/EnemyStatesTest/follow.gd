extends EnemyState
class_name EnemyFollowTest

func on_enter():
	print("usao u follow")
	
func transition():
	if player_cast.is_colliding():
		get_parent().change_state("Attack")
