extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.transition_backwards == false:
		$Player.global_transform.origin.x = 25
		$Player.global_transform.origin.y = 155
	else:
		$Player.global_transform.origin.x = 416
		$Player.global_transform.origin.y = 155


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scene()


func _on_room_1_transition_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true
		Global.transition_backwards = true


func _on_room_3_transition_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true
		Global.transition_backwards = false


func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "level2_room2":
			if Global.transition_backwards == true:
				get_tree().change_scene_to_file("res://Levels/level2/level2_room1.tscn")
				Global.finish_change_scene("level2_room1")
			else:
				get_tree().change_scene_to_file("res://Levels/level2/level2_room3.tscn")
				Global.finish_change_scene("level2_room3")
