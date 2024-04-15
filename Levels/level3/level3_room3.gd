extends Node2D


func _ready():
	if Global.transition_backwards == false:
		$Player.global_transform.origin.x = 25
		$Player.global_transform.origin.y = 155
	else:
		$Player.global_transform.origin.x = 416
		$Player.global_transform.origin.y = 155


func _process(_delta):
	change_scene()


func _on_room_2_transition_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true
		Global.transition_backwards = true


func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "level3_room3":
			if Global.transition_backwards == true:
				get_tree().change_scene_to_file("res://Levels/level3/level3_room2.tscn")
				Global.finish_change_scene("level3_room2")
