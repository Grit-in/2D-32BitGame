extends Control

var dummy_asp : String = "16:9"
@onready var asp_list : OptionButton = %Aspectiratio_list
@onready var res_list : OptionButton = %Res_list

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
	for aspect_ratio in resolutions.keys():
		print(typeof(aspect_ratio))

func _on_aspectiratio_list_item_selected(index):
	pass # Replace with function body.


func _on_res_list_item_selected(index):
	pass # Replace with function body.
