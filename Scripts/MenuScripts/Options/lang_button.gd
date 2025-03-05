extends Control

@onready var new_font : Font = preload("res://Font/LanaPixel.ttf")
@onready var button : Button = $Button
@export var language_name : String = "English"
@export var langcode : String =  "en"
var langNames = ["English","Français","Deutsch","Español","Português",
				 "日本語","中国人","中國人","Русский","Српски"]

var langCode = ["en","fr","jp","de","es","pr","man","can","srp","rus"]

func _ready():
	print(ConfigFileHandler.load_language_settings())
	TranslationServer.set_locale("en")
	#When getting input ignores anything that isnt action
	set_process_unhandled_input(false)
	updateUi()
	
#Implement better system dont be an idiot

func updateUi() -> void:
	
	match language_name:
		"English":
			button.text = langNames[0]
		"Français":
			button.text = langNames[1]
		"Deutsch":
			button.text = langNames[2]
		"Español":
			button.text = langNames[3]
		"Português":
			button.text = langNames[4]
		"日本語":
			button.add_theme_font_override("font",new_font)
			button.text = langNames[5]
		"中国人":
			button.add_theme_font_override("font",new_font)
			button.text = langNames[6]
		"中國人":
			button.add_theme_font_override("font",new_font)	
			button.text = langNames[7]
		"Русский":
			button.text = langNames[8]
		"Српски":
			button.text = langNames[9]


func _on_button_pressed():
	change_language(langcode)
	
# Ugly ass looking "switch casae" unlucky but it is what it is sets the translation
# to the on_click button
func change_language(code):
		
	match langcode:
		"en":
			TranslationServer.set_locale("en")
			ConfigFileHandler.save_language_settings("language","en")
		"fr":
			TranslationServer.set_locale("fr")
			ConfigFileHandler.save_language_settings("language","fr")
		"de":
			TranslationServer.set_locale("de")
			ConfigFileHandler.save_language_settings("language","de")
		"es":
			TranslationServer.set_locale("es")
			ConfigFileHandler.save_language_settings("language","es")
		"pr":
			TranslationServer.set_locale("pr")
			ConfigFileHandler.save_language_settings("language","pr")
		"jp":
			TranslationServer.set_locale("jp")
			ConfigFileHandler.save_language_settings("language","jp")
		"man":
			TranslationServer.set_locale("man")
			ConfigFileHandler.save_language_settings("language","man")
		"can":
			TranslationServer.set_locale("can")
			ConfigFileHandler.save_language_settings("language","can")
		"rus":
			TranslationServer.set_locale("rus")
			ConfigFileHandler.save_language_settings("language","rus")
		"srp":
			TranslationServer.set_locale("srp")
			ConfigFileHandler.save_language_settings("language","srp")
