extends Node2D


func _on_door_1_body_entered(body):
	if body.has_method("player"):
		get_tree().change_scene_to_file("res://Levels/level2/puzzle_maze/maze_room1.tscn")


func _on_door_2_body_entered(body):
	if body.has_method("player"):
		get_tree().change_scene_to_file("res://Levels/level2/puzzle_maze/maze_room2.tscn")
