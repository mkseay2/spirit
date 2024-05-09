extends Node

var current_scene = 1
var transition_scene = false
var player_health = 100
#var player_alive = true
var enemy_count = 1


func finish_change_scene(new_scene):
	if transition_scene == true:
		if (current_scene == 3) and (new_scene == 4):
			player_health = 100
		elif (current_scene == 6) and (new_scene == 7):
			player_health = 100
		
		transition_scene = false
		current_scene = new_scene
		enemy_count = 1


func process_enemy_death():
	enemy_count = 0


func process_player_death():
	player_health = 100
	enemy_count = 1
	
	if (current_scene == 1) or (current_scene == 2) or (current_scene == 3):
		current_scene = 1
		get_tree().change_scene_to_file("res://Levels/level1/level1_room1.tscn")
	elif (current_scene == 4) or (current_scene == 5) or (current_scene == 6):
		current_scene = 4
		get_tree().change_scene_to_file("res://Levels/level2/level2_room1.tscn")
	elif (current_scene == 7) or (current_scene == 8) or (current_scene == 9):
		current_scene = 7
		get_tree().change_scene_to_file("res://Levels/level3/level3_room1.tscn")
