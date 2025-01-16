extends State
class_name EnemyDeathState

func on_enter():
	playback.travel("death")
	# fix later shit implementation


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "death":
		get_parent().get_parent().queue_free()
