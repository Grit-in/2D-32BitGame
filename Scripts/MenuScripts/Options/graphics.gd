extends Control

var dummy_asp : String = "16:9"
@onready var asp_list : OptionButton = $ResBtnMargin/Labels/VBoxContainer2/Aspect_list
@onready var res_list : OptionButton = $ResBtnMargin/Labels/VBoxContainer2/Res_list 
@onready var fs_button : BaseButton = $ResBtnMargin/Labels/VBoxContainer2/Fullscreencheck
var fs : bool = false

@onready var resolutions : Dictionary = {
	"16:9": {
		"1920x1080": Vector2i(1920, 1080),
		"1280x720": Vector2i(1280, 720),
		"640x360": Vector2i(640, 360)
	},
	"4:3": {
		"1600x1200": Vector2i(1600, 1200),
		"1280x960": Vector2i(1280, 960),
		"1024x768": Vector2i(1024, 768),
		"800x600": Vector2i(800, 600),
		"640x480": Vector2i(640, 480)
	},
	"16:10": {
		"1920x1200": Vector2i(1920, 1200),
		"1680x1050": Vector2i(1680, 1050),
		"1440x900": Vector2i(1440, 900),
		"1280x800": Vector2i(1280, 800)
	}
}

# Called when the node enters the scene tree for the first time.
func _ready():
	dummy_asp = ConfigFileHandler.load_video_settings().get("aspect_ratio")
	for aspect_ratio in resolutions.keys():
		asp_list.add_item(aspect_ratio)
	
	for res in resolutions.get(dummy_asp):
		res_list.add_item(res)
	
	#Sets the variables to the config settings
	asp_list.select(Helper.get_dict_index(
				resolutions,ConfigFileHandler.load_video_settings().get("aspect_ratio"))
				)
				
	res_list.select(Helper.get_dict_index(resolutions[ConfigFileHandler.load_video_settings().get("aspect_ratio")],
				ConfigFileHandler.load_video_settings().get("resolution"))
				)
				
	fs_button.button_pressed = ConfigFileHandler.load_video_settings().get("fullscreen")
	
func _on_aspectiratio_list_item_selected(index):
	_fill_resolution_bar(asp_list.get_item_text(index))

#helper function refreshes the drop down list for resolution
func _fill_resolution_bar(res : String) -> void:
	res_list.clear()
	dummy_asp = res
	for resolution in resolutions.get(res):
		res_list.add_item(resolution)
	
#Function that just sets the window size to the selected size
func _on_res_list_item_selected(index):
	var res = res_list.get_item_text(index).split("x")
	DisplayServer.window_set_size(Vector2i(int(res[0]), int(res[1])))
	Helper.set_screen_center(int(res[0]), int(res[1]))
		
# Function called when fullscreen button is pressed swaps from fullscreen on/off
func _on_fullscreencheck_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
