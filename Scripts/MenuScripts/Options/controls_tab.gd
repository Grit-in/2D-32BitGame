extends Control


@onready var new_font : Font = preload("res://Font/LanaPixel.ttf")
@onready var def_font : Font = preload("res://Font/joystix monospace.otf")
@onready var actions = $TabContainer/CONTROL_KEY/MarginContainer/VBoxContainer.get_children()
@onready var graphics =  $TabContainer/GRAPHICS_KEY/MarginContainer/ResolutionBtn3


# Sets the last set language in the config
func _ready():
	TranslationServer.set_locale(ConfigFileHandler.load_language_settings())

# Saves the current settings in the config
func _on_save_key_pressed():
	
	
	
	#Saving graphics settings
	var res_btn_children = Helper.get_scene_children(graphics)
	for k in res_btn_children:
		if k.name == "Res_list":
			ConfigFileHandler.save_video_settings("resolution",k.text)
		elif k.name == "Aspect_list":
			print(k.text)
			ConfigFileHandler.save_video_settings("aspect_ratio",k.text)
		elif k.name == "Fullscreencheck":
			ConfigFileHandler.save_video_settings("fullscreen",k.button_pressed)
			
			

# Rebinds the current action key
func _on_reset_key_pressed():
	for key in actions:
		if key is HotKeyRebind:
			print(key.action_name + " " + key.button.text)
