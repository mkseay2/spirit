extends Node2D

var enemy_count = 1


func _ready():
	$Player.global_transform.origin.x = 25
	$Player.global_transform.origin.y = 155


func _process(_delta):
	change_scene()


func change_scene():
	# TODO: check for level completion
	pass
