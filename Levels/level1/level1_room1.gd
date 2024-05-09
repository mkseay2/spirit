extends Node2D


func _ready():
	pass


func _process(_delta):
	change_scene()
	$CanvasLayer/TextureProgressBar.value = Global.player_health


func _on_room_2_transition_body_entered(body):
	if body.has_method("player") and (Global.enemy_count <= 0):
		Global.transition_scene = true


func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == 1:
			get_tree().change_scene_to_file("res://Levels/level1/level1_room2.tscn")
			Global.finish_change_scene(2)
