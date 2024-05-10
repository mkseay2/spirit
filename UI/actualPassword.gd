class_name ActualPassword
extends Control

var blueCount = 0
var greenCount = 0
var yellowCount = 0
var redCount = 0

var levelComplete = 0


var blueFlag = 1
var greenFlag = 0
var redFlag = 0
var yellowFlag = 0

@onready var blueCountLabel = $CanvasLayer/Control/BlueLabel
@onready var greenCountLabel = $CanvasLayer/Control/GreenLabel
@onready var redCountLabel = $CanvasLayer/Control/RedLabel
@onready var yellowCountLabel = $CanvasLayer/Control/YellowLabel
@onready var pressEnterLabel = $CanvasLayer/Control/pressEnter
var puzzle_complete = false
func _process_failed_puzzle():
	if Global.enemy_count == 1:
		get_tree().change_scene_to_file("res://Levels/level3/level3_room1.tscn")
	else:
		get_tree().change_scene_to_file("res://Levels/level3/level3_room1.tscn")
func _process_complete_puzzle():
	if Global.enemy_count == 1:
		get_tree().change_scene_to_file("res://Levels/level3/level3_room1.tscn")
		Global.process_puzzle_complete()
	else:
		get_tree().change_scene_to_file("res://Levels/level3/level3_room1.tscn")
		Global.process_puzzle_complete()
		

func updateBlueCount(value):
	blueCount = 0
	blueCount += value
	blueCountLabel.text = "Blue: %d" % blueCount


func updateRedCount(value):
	redCount = 0
	redCount += value
	redCountLabel.text = "Red: %d" % redCount


func updateGreenCount(value):
	greenCount = 0
	greenCount += value
	greenCountLabel.text = "Green: %d" % greenCount


func updateYellowCount(value):
	yellowCount = 0
	yellowCount += value
	yellowCountLabel.text = "Yellow: %d" % yellowCount




func _on_1_button_pressed():
	if blueFlag == 1:
		updateBlueCount(1)
	if greenFlag == 1:
		updateGreenCount(1)
	if redFlag == 1:
		updateRedCount(1)
	if yellowFlag == 1:
		updateYellowCount(1)


func _on_4_button_pressed():
	if blueFlag == 1:
		updateBlueCount(4)
	if greenFlag == 1:
		updateGreenCount(4)
	if redFlag == 1:
		updateRedCount(4)
	if yellowFlag == 1:
		updateYellowCount(4)


func _on_7_button_pressed():
	if blueFlag == 1:
		updateBlueCount(7)
	if greenFlag == 1:
		updateGreenCount(7)
	if redFlag == 1:
		updateRedCount(7)
	if yellowFlag == 1:
		updateYellowCount(7)


func _on_3_button_pressed():
	if blueFlag == 1:
		updateBlueCount(3)
	if greenFlag == 1:
		updateGreenCount(3)
	if redFlag == 1:
		updateRedCount(3)
	if yellowFlag == 1:
		updateYellowCount(3)


func _on_6_button_pressed():
	if blueFlag == 1:
		updateBlueCount(6)
	if greenFlag == 1:
		updateGreenCount(6)
	if redFlag == 1:
		updateRedCount(6)
	if yellowFlag == 1:
		updateYellowCount(6)


func _on_9_button_pressed():
	if blueFlag == 1:
		updateBlueCount(9)
	if greenFlag == 1:
		updateGreenCount(9)
	if redFlag == 1:
		updateRedCount(9)
	if yellowFlag == 1:
		updateYellowCount(9)


func _on_2_button_pressed():
	if blueFlag == 1:
		updateBlueCount(2)
	if greenFlag == 1:
		updateGreenCount(2)
	if redFlag == 1:
		updateRedCount(2)
	if yellowFlag == 1:
		updateYellowCount(2)


func _on_5_button_pressed():
	if blueFlag == 1:
		updateBlueCount(5)
	if greenFlag == 1:
		updateGreenCount(5)
	if redFlag == 1:
		updateRedCount(5)
	if yellowFlag == 1:
		updateYellowCount(5)


func _on_8_button_pressed():
	if blueFlag == 1:
		updateBlueCount(8)
	if greenFlag == 1:
		updateGreenCount(8)
	if redFlag == 1:
		updateRedCount(8)
	if yellowFlag == 1:
		updateYellowCount(8)


func _on_0_button_pressed():
	if blueFlag == 1:
		updateBlueCount(0)
	if greenFlag == 1:
		updateGreenCount(0)
	if redFlag == 1:
		updateRedCount(0)
	if yellowFlag == 1:
		updateYellowCount(0)


func _on_check_button_pressed():
	Global.is_returning = true
	if blueFlag == 1:
		if blueCount == 8:
			blueCountLabel.text = "Blue: Good"
			blueFlag = 0
			greenFlag = 1
		elif blueCount != 8:
			blueCountLabel.text = "Blue: Nope"
			blueCount = 0
			blueFlag = 1
			blueCount = 0
			greenCount = 0
			yellowCount = 0
			redCount = 0
			await get_tree().create_timer(2).timeout
			_process_failed_puzzle()
	elif greenFlag == 1:
		if greenCount == 4:
			greenCountLabel.text = "Green: Good"
			greenFlag = 0
			redFlag = 1
		elif greenCount != 4:
			greenCountLabel.text = "Green: Nope"
			greenCount = 0
			blueFlag = 1
			greenFlag = 0
			blueCount = 0
			greenCount = 0
			yellowCount = 0
			redCount = 0
			await get_tree().create_timer(2).timeout
			_process_failed_puzzle()
	elif redFlag == 1:
		if redCount == 6:
			redCountLabel.text = "Red: Good"
			redFlag = 0
			yellowFlag = 1
		elif redCount != 6:
			redCountLabel.text = "Red: Nope"
			redCount = 0
			blueFlag = 1
			redFlag = 0
			blueCount = 0
			greenCount = 0
			yellowCount = 0
			redCount = 0
			await get_tree().create_timer(2).timeout
			_process_failed_puzzle()
	elif yellowFlag == 1:
		if yellowCount == 2:
			yellowCountLabel.text = "Yellow: Good"
			yellowFlag = 0
			pressEnterLabel.text = "Press Enter"
			levelComplete = 1
			puzzle_complete = true
			if levelComplete == 1:
				_process_complete_puzzle()
		elif yellowCount != 2:
			yellowCount.text = "Yellow: Nope"
			yellowCount = 0
			blueFlag = 1
			yellowFlag = 0
			blueCount = 0
			greenCount = 0
			yellowCount = 0
			redCount = 0
			await get_tree().create_timer(2).timeout
			_process_failed_puzzle()

