extends Control

@onready var new_font : Font = preload("res://Font/LanaPixel.ttf")
@onready var def_font : Font = preload("res://Font/joystix monospace.otf")

# TODO Make the save file save the encrypted version idk why it doesnt work now lol

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/LoadingScreen/LoadingScreenBar.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
var jp = "jp"
var last = "en"
func _ready():
	last = TranslationServer.get_locale()
	TranslationServer.set_locale(last)
		
func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options.tscn")
