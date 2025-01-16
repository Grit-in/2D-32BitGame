extends Control
class_name Options


var last = "en"
func _ready():
	TranslationServer.set_locale(ConfigFileHandler.load_language_settings())

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
