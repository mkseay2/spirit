extends Node

var current_scene = 1
var transition_scene = false
var player_health = 100
var player_alive = true
var enemy_count = 0


func finish_change_scene(new_scene):
	if transition_scene == true:
		if (current_scene == 3) and (new_scene == 4):
			player_health = 100
		elif (current_scene == 6) and (new_scene == 7):
			player_health = 100
		
		transition_scene = false
		current_scene = new_scene
		enemy_count = 0


func process_enemy_death():
	enemy_count = 0
