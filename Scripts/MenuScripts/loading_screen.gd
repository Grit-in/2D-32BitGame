extends CanvasLayer

	
func change_scene_to_file(target) -> void:
	$AnimationPlayer.play('dissolve')
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(target)
	$AnimationPlayer.play_backwards('dissolve')
