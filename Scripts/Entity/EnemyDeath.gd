extends EnemyState
class_name EnemyDeathState

func on_enter():
	playback.travel("death")
