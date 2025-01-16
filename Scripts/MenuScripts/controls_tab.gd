extends Control

var last = "en"
@onready var new_font : Font = preload("res://Font/LanaPixel.ttf")
@onready var def_font : Font = preload("res://Font/joystix monospace.otf")
@onready var actions = $TabContainer/CONTROL_KEY/MarginContainer/VBoxContainer.get_children()


func _ready():
	TranslationServer.set_locale(ConfigFileHandler.load_language_settings())


func _on_save_key_pressed():
	print(ConfigFileHandler.load_language_settings())


func _on_reset_key_pressed():
	for key in actions:
		if key is HotKeyRebind:
			print(key.action_name + " " + key.button.text)
