extends Node2D




func _ready():
	if (Global.is_returning == true):
		$Player.global_transform.origin.x = 130
		$Player.global_transform.origin.y = 230
		$AnimatedBlock.play("default")
	else:
		$Player.global_transform.origin.x = 25
		$Player.global_transform.origin.y = 155
		$AnimatedBlock.play("default")


func _process(_delta):
	change_scene()
	$CanvasLayer/TextureProgressBar.value = Global.player_health


func change_scene():
	if (Global.enemy_count <= 0) && (Global.puzzle_complete == true):
		get_tree().change_scene_to_file("res://UI/game_over.tscn")


func _on_area_2d_body_entered(body):
	pass # Replace with function body.
