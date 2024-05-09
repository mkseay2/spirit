extends CharacterBody2D

# could increase speed per level to add difficulty
var speed = 0.9
var chase_player = false
var player = null
var health = 60
var player_cool_down = false

func _physics_process(_delta):
	if chase_player:
		velocity = (player.get_global_position() - position).normalized() * speed
	else:
		velocity = lerp(velocity, Vector2.ZERO, 0.07)
	move_and_collide(velocity)


func _on_detection_area_body_entered(body):
	if body.has_method("player"):
		chase_player = true
		player = body


func _on_detection_area_body_exited(body):
	if body.has_method("player"):
		chase_player = false
		player = null


func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	velocity.x = 0
	velocity.y = 0
	health = health - 15
	
	print("enemy health = ", health)
	
	# if enemy has died
	if (health <= 0):
		queue_free()


func process_player_attack():
	if (player_cool_down == false):
		health = health - 15
		if (health <= 0):
			# TODO: player is dead, restart level
			queue_free()
		else:
			# begin cool down period so enemy cannot spam attacks
			player_cool_down = true
			$attack_cool_down_timer.start()
