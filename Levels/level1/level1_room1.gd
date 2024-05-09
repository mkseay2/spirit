extends Node2D

var enemy_count = 1


func _ready():
	if Global.new_game == false:
		$Player.global_transform.origin.x = 416
		$Player.global_transform.origin.y = 155


func _process(_delta):
	change_scene()


func _on_room_2_transition_body_entered(body):
	if (body.has_method("player") and (enemy_count == 0)):
		Global.transition_scene = true


func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "level1_room1":
			get_tree().change_scene_to_file("res://Levels/level1/level1_room2.tscn")
			Global.finish_change_scene("level1_room2")
			Global.new_game = false
