extends Label




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var fps = Engine.get_frames_per_second()
	text = "FPS : " + str(fps)
	self.modulate = Color.BLACK
