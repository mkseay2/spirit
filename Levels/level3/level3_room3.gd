extends Node2D


func _ready():
	$Player.global_transform.origin.x = 25
	$Player.global_transform.origin.y = 155


func _process(_delta):
	change_scene()
	$CanvasLayer/TextureProgressBar.value = Global.player_health


func change_scene():
	# TODO: check for level completion
	pass
