extends Node


var current_scene = "level1_room1"
var transition_scene = false

# used to determine whether the player is going to the next room 
# or the previous room
var transition_backwards = false


func finish_change_scene(new_scene):
	print("finish change scene")
	if transition_scene == true:
		print("entered if")
		transition_scene = false
		current_scene = new_scene
