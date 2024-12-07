extends Node2D


func _ready() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	get_window().size = Vector2(640,480)
	
	



func _process(delta: float) -> void:
	pass
