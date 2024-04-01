class_name MainMenu
extends Control

@onready var new_game_button = $VBoxContainer/NewGameButton as Button
@onready var resume_game_button = $VBoxContainer/ResumeGameButton as Button
@onready var exit_game_button = $VBoxContainer/ExitGameButton as Button
@onready var start_level = preload("res://Levels/level1/level1_room1.tscn") as PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game_button.button_down.connect(on_new_game_pressed)
	exit_game_button.button_down.connect(on_exit_pressed)


func on_new_game_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)


func on_exit_pressed() -> void:
	get_tree().quit()
