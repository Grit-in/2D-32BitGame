extends Node

#This script will have all the help methods for the project so 
#I dont have to rewrite half the stuff

#For some reason this dogshit ass language doesnt have this function built in ty godot
#Find the index of a key el in the dict
func get_dict_index(dict : Dictionary, key : String) -> int:
	var i : int = 0
	for index in dict.keys():
		if index == key:
			return i
		i+=1
	return i
	

# Recursive way to get all the nodes for the given node loops the tree until it 
# gets all nodes and returns an array
func get_scene_children(scene : Node):
	return get_all_children(scene)
	
func get_all_children(node):
	var nodes = []
	for child in node.get_children():
		nodes.append(child)
		nodes.append_array(get_all_children(child))  # Recursively get all descendants
	return nodes


# Centers the screen for the current selected resolution
func set_screen_center(w : int,h : int) -> void:
		var screen_size = DisplayServer.screen_get_size()
		var new_pos = (screen_size - Vector2i(w, h)) / 2
		DisplayServer.window_set_position(new_pos)
