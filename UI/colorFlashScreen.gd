extends Control

var correct_sequence = ["blue", "green", "red", "yellow", "red", "blue", "green", "red"]
var player_input = []

@onready var sequenceCorrect = $CanvasLayer/Control/Label

var puzzle_complete = false
func _process_failed_puzzle():
	if Global.enemy_count == 1:
		get_tree().change_scene_to_file("res://Levels/level3/level3_room3.tscn")
	else:
		get_tree().change_scene_to_file("res://Levels/level3/level3_room3.tscn")
func _process_complete_puzzle():
	if Global.enemy_count == 1:
		get_tree().change_scene_to_file("res://Levels/level3/level3_room3.tscn")
		Global.process_puzzle_complete()
	else:
		get_tree().change_scene_to_file("res://Levels/level3/level3_room3.tscn")
		Global.process_puzzle_complete()
		


func _on_red_button_pressed():
	player_input.append("red")


func _on_green_button_pressed():
	player_input.append("green")


func _on_blue_button_pressed():
	player_input.append("blue")


func _on_yellow_button_pressed():
	player_input.append("yellow")


func _on_check_button_pressed():
	if player_input == correct_sequence:
		sequenceCorrect.text = "Correct"
		await get_tree().create_timer(2).timeout
		_process_complete_puzzle()
	else:
		sequenceCorrect.text = "Incorrect"
		await get_tree().create_timer(2).timeout
		_process_failed_puzzle()
