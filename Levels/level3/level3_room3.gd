extends Node2D


func _ready():
	$Player.global_transform.origin.x = 25
	$Player.global_transform.origin.y = 155
	$AnimatedSprite2D.play("default")


func _process(_delta):
	change_scene()
	$CanvasLayer/TextureProgressBar.value = Global.player_health


func change_scene():
	if (Global.enemy_count <= 0):
		get_tree().change_scene_to_file("res://UI/game_over.tscn")


func _on_area_2d_body_entered(body):
	pass # Replace with function body.
