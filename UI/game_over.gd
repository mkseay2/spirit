#class_name MainMenu
extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


#func on_exit_pressed():
	#get_tree().quit()


func _on_exit_game_button_pressed():
	get_tree().quit()