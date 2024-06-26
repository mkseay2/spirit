extends Node2D


func _ready():
	if (Global.puzzle_complete == true):
		$Player.global_transform.origin.x = 176
		$Player.global_transform.origin.y = 112
	else:
		$Player.global_transform.origin.x = 25
		$Player.global_transform.origin.y = 155


func _process(_delta):
	change_scene()
	$CanvasLayer/TextureProgressBar.value = Global.player_health


func _on_level_3_transition_body_entered(body):
	if body.has_method("player") and (Global.enemy_count <= 0) and (Global.puzzle_complete == true):
		Global.transition_scene = true


func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == 6:
			get_tree().change_scene_to_file("res://Levels/level3/level3_room1.tscn")
			Global.finish_change_scene(7)


func _on_door_body_entered(body):
	if body.has_method("player") and (Global.puzzle_complete == false):
		get_tree().change_scene_to_file("res://Levels/level2/puzzle_maze/maze_room1.tscn")
