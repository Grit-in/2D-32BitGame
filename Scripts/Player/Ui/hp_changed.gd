extends Label

@export var float_speed : Vector2 = Vector2(0,-50)

func _process(delta):
	position += float_speed * delta
