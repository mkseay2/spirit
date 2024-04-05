extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scene()


func _on_room_2_transition_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true


#func _on_room_2_transition_body_exited(body):
	#if body.has_method("player"):
		#Global.transition_scene = false


func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "level1_room1":
			get_tree().change_scene_to_file("res://Levels/level1/level1_room2.tscn")
			Global.finish_change_scene("level1_room2")
