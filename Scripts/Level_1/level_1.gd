extends Node2D
class_name Level1

func _ready():
	#BG color 000903
	RenderingServer.set_default_clear_color(Color("#F3ECD6"))
	


func _on_finish_line_body_entered(body):
	$Entities/Player/Animations/AnimationPlayer.play("finish")
	$AnimTimer.start()


func _on_anim_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/LoadingScreen/LoadingScreenBar.tscn")
