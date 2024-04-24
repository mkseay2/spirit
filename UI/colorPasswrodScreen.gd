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


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func updateBlueCount():
	blueCount += 1
	
