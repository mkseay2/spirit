extends Node2D

var enemy_count = 1


func _ready():
	$Player.global_transform.origin.x = 25
	$Player.global_transform.origin.y = 155


func _process(_delta):
	change_scene()


func _on_room_2_transition_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true


func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "level3_room1":
			get_tree().change_scene_to_file("res://Levels/level3/level3_room2.tscn")
			Global.finish_change_scene("level3_room2")
