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
	#Language settings 
	last = ConfigFileHandler.load_language_settings()
	TranslationServer.set_locale(last)
	
	#Graphics setting load
	var toggled_on = ConfigFileHandler.load_video_settings().get("fullscreen")
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
	var res = ConfigFileHandler.load_video_settings().get("resolution").split("x")
	DisplayServer.window_set_size(Vector2i(int(res[0]), int(res[1])))
	Helper.set_screen_center(int(res[0]), int(res[1]))
	
	
func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Options/options.tscn")
