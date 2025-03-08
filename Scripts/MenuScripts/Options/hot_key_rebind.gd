extends Control
class_name HotKeyRebind

@onready var label : Label = $HBoxContainer/Label
@onready var button : Button = $HBoxContainer/Button

var is_remapping = false
var action_to_remap
var remaping_button

@export var action_name : String =  "move_left"
@onready var new_font : Font = preload("res://Font/LanaPixel.ttf")
@onready var def_font : Font = preload("res://Font/joystix monospace.otf")

func _ready():
	TranslationServer.set_locale(ConfigFileHandler.load_language_settings())
	if TranslationServer.get_locale() == "jp" or TranslationServer.get_locale() == "can" or TranslationServer.get_locale() == "man":
		$HBoxContainer/Label.add_theme_font_override("font",new_font)
	else:
		$HBoxContainer/Label.add_theme_font_override("font",def_font)
	#When getting input ignores anything that isnt action
	set_process_unhandled_input(false)
	set_action_name()
	set_text_for_key()
	
func set_action_name() -> void:
	label.text = "Unassigned"
	
	match action_name:
		"move_left":
			label.text = "LEFT_KEY"
		"move_right":
			label.text = "RIGHT_KEY"
		"move_jump":
			label.text = "JUMP_KEY"
		"dash":
			label.text = "DASH_KEY"
		"attack":
			label.text = "ATTACK_KEY"


func set_text_for_key() -> void: 
	var actions = InputMap.action_get_events(action_name)
	var action = actions[0]
	button.text = "%s" %  OS.get_keycode_string(action.physical_keycode)


func _on_button_pressed():
	if not is_remapping:
		is_remapping = true
		action_to_remap = action_name
		remaping_button = button
		button.text = "Press any key..."
		
func _input(event):
	if is_remapping:
		if event is InputEventKey and event.is_pressed():
			InputMap.action_erase_events(action_to_remap)
			InputMap.action_add_event(action_to_remap,event)
			set_text_for_key()
			is_remapping = false
			action_to_remap = null
			remaping_button = null
			
			accept_event()
