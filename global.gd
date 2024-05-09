extends Node


var current_scene = 1
var transition_scene = false
var player_health = 100
var player_alive = true

var new_game = true


func finish_change_scene(new_scene):
	if transition_scene == true:
		transition_scene = false
		current_scene = new_scene
