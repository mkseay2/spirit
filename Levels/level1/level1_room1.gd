extends Node2D

var enemy_count = 1


func _ready():
	pass


func _process(_delta):
	change_scene()


func _on_room_2_transition_body_entered(body):
	if (body.has_method("player") and (enemy_count == 1)):
		Global.transition_scene = true


func change_scene():
	if Global.transition_scene == true and (enemy_count <= 0):
		if Global.current_scene == 1:
			get_tree().change_scene_to_file("res://Levels/level1/level1_room2.tscn")
			Global.finish_change_scene(2)
