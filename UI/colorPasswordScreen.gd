class_name colorPassword
extends Control

var blueCount = 0
var greenCount = 0
var yellowCount = 0
var redCount = 0

@onready var blueCountLabel
@onready var redCountLabel
@onready var greenCountLabel
@onready var yellowCountLabel

func updateBlueCount():
	blueCount += 1
	blueCountLabel.text = "%d" % blueCount


func updateRedCount():
	redCount += 1
	redCountLabel.text = "%d" % redCount

func updateGreenCount():
	greenCount += 1
	greenCountLabel.text = "%d" % greenCount

func updateYellowCount():
	yellowCount += 1
	yellowCountLabel.text = "%d" % yellowCount

	


func _on_yellow_button_pressed():
	pass # Replace with function body.



func _on_red_button_pressed():
	pass # Replace with function body.
	

func _on_green_button_pressed():
	pass # Replace with function body.


func _on_blue_button_pressed():
	pass # Replace with function body.
