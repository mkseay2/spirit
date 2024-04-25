class_name colorPassword
extends Control

var blueCount = 0
var greenCount = 0
var yellowCount = 0
var redCount = 0

var blueFlag = 1
var greenFlag = 0
var redFlag = 0
var yellowFlag = 0


@onready var blueCountLabel = $ColorPasswordScreen/TextureRect2/ColorDisplay/ColorUI/BlueLabel
@onready var redCountLabel = $ColorPasswordScreen/TextureRect2/ColorDisplay/ColorUI/redLabel
@onready var greenCountLabel = $ColorPasswordScreen/TextureRect2/ColorDisplay/ColorUI/GreenLabel
@onready var yellowCountLabel = $ColorPasswordScreen/TextureRect2/ColorDisplay/ColorUI/YellowLabel

func updateBlueCount(value):
	blueCount += value
	blueCountLabel.text = "Blue: %d" % blueCount


func updateRedCount(value):
	redCount += value
	redCountLabel.text = "Red: %d" % redCount


func updateGreenCount(value):
	greenCount += value
	greenCountLabel.text = "Green: %d" % greenCount


func updateYellowCount(value):
	yellowCount += value
	yellowCountLabel.text = "Yellow: %d" % yellowCount

	






func _on_1_button_pressed():
	pass # Replace with function body.
	

func _on_4_button_pressed():
	pass # Replace with function body.


func _on_7_button_pressed():
	pass # Replace with function body.


func _on_9_button_pressed():
	pass # Replace with function body.
	


func _on_6_button_pressed():
	pass # Replace with function body.


func _on_3_button_pressed():
	pass # Replace with function body.
	


func _on_2_button_pressed():
	pass # Replace with function body.


func _on_5_button_pressed():
	pass # Replace with function body.
	


func _on_8_button_pressed():
	pass # Replace with function body.


func _on_0_button_pressed():
	pass # Replace with function body.


func _on_check_button_pressed():
	pass # Replace with function body.
