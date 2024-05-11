extends CharacterBody2D

var speed = 200
var veloc = Vector2.ZERO

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	direction = direction.normalized()

	veloc = direction * speed

	var collision = move_and_collide(veloc * delta)

	if collision and collision.collider is CharacterBody2D:
		collision.collider.move_and_collide(veloc * delta)
