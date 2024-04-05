extends Node


var current_scene = "level1_room1"
var transition_scene = false


func finish_change_scene(new_scene):
	if transition_scene == true:
		transition_scene = false
		current_scene = new_scene
