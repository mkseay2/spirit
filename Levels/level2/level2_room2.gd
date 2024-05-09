extends Node2D

var enemy_count = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.global_transform.origin.x = 25
	$Player.global_transform.origin.y = 155


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scene()


func _on_room_3_transition_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true


func change_scene():
	if Global.transition_scene == true and (enemy_count <= 0):
		if Global.current_scene == 5:
			get_tree().change_scene_to_file("res://Levels/level2/level2_room3.tscn")
			Global.finish_change_scene(6)
