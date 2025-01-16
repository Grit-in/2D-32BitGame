extends Node


var config  = ConfigFile.new()
const SETTINGS_FILE_PATH = "user://settings.ini"


func _ready():
	
	#Sets Default settings in ini file
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		
		config.set_value("keybinds","move_left","A")
		config.set_value("keybinds","move_right","D")
		config.set_value("keybinds","move_jump","Space")
		config.set_value("keybinds","move_down","S")
		config.set_value("keybinds","dash","Shift")
		config.set_value("keybinds","attack","H")
		
		config.set_value("video","fullscreen",true)
		config.set_value("video","screen_shake",false)
		
		config.set_value("language","language","en")
		
		config.set_value("sound","master_volume",1.0)
		config.set_value("sound","sfx_volume",1.0)
		config.set_value("sound","bgm_volume",1.0)
		
		config.save(SETTINGS_FILE_PATH)
	else:
		config.load(SETTINGS_FILE_PATH)

func save_video_settings(key : String, value):
	config.set_value("video",key,value)
	config.save(SETTINGS_FILE_PATH)

func load_video_settings():
	var video_settings = {}
	for key in config.get_section_keys("video"):
		video_settings[key] = config.get_value("video",key)
	return video_settings

func save_language_settings(key : String, value):
	print(key + " " + value)
	config.set_value("language",key,value)
	config.save(SETTINGS_FILE_PATH)

func load_language_settings():
	var language_settings = {}
	for key in config.get_section_keys("language"):
		language_settings[key] = config.get_value("language",key)
	return language_settings["language"]
