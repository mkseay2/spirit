extends CharacterBody2D

@export var speed = 100

func get_input():
	# uses the four arrow keys
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction.normalized() * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()
	
func player():
	pass
