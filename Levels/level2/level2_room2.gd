extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.global_transform.origin.x = 25
	$Player.global_transform.origin.y = 155


func _process(_delta):
	change_scene()
	$CanvasLayer/TextureProgressBar.value = Global.player_health


func _on_room_3_transition_body_entered(body):
	if body.has_method("player") and (Global.enemy_count <= 0):
		Global.transition_scene = true


func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == 5:
			get_tree().change_scene_to_file("res://Levels/level2/level2_room3.tscn")
			Global.finish_change_scene(6)
