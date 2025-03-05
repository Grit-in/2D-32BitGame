extends Control
class_name Options


# Sets the last set language in the config
func _ready():
	TranslationServer.set_locale(ConfigFileHandler.load_language_settings())

# Swaps scene to main menu
func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
