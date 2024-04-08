extends Node


var current_scene = "level1_room1"
var transition_scene = false

# used to determine whether the player is going to the next room 
# or the previous room
var transition_backwards = false
var new_game = true


func finish_change_scene(new_scene):
	if transition_scene == true:
		transition_scene = false
		current_scene = new_scene
