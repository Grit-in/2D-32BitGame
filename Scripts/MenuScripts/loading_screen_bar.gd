extends Control

var progress = []
var sceneName
var sceneName2
var scene_load_status = 0
var newScene
var dummy = false
func _ready():
	$AnimatedSprite2D.play("start")
	$AnimatedSprite2D.play("loop")
	
	#Temp solution before the save file then after that we will read the lvl from the config
	
	sceneName = "res://Scenes/Levels/level_1.tscn"
	sceneName2 = "res://Scenes/Levels/level_2.tscn"

	if dummy:
		ResourceLoader.load_threaded_request(sceneName2)
	else:
		dummy = true
		ResourceLoader.load_threaded_request(sceneName)

func _process(delta):
	
	#Checks the status of the level thread
	if dummy:
		scene_load_status = ResourceLoader.load_threaded_get_status(sceneName,progress)
	else:
		scene_load_status = ResourceLoader.load_threaded_get_status(sceneName2,progress)
		
	if progress[0]*100 != 0:
		$TextureProgressBar.value = floor(progress[0] * 100)
		$Countdown.text = str(floor(progress[0]*100)) + "%"
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		$Countdown.text = "100%"
		if dummy:
			newScene  = ResourceLoader.load_threaded_get(sceneName)
		else:
			newScene  = ResourceLoader.load_threaded_get(sceneName2)
		LoadingScreen.change_scene_to_file(newScene)
