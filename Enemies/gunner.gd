extends CharacterBody2D

# could increase speed per level to add difficulty
var speed = 0.9
var chase_player = false
var player = null
var health = 3
var player_cool_down = false
var delta = null

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


func process_player_attack():
	if (player_cool_down == false):
		health = health - 1
		if (health <= 0):
			queue_free()
			Global.process_enemy_death()
		else:
			# begin cool down period so enemy cannot spam attacks
			player_cool_down = true
			$attack_cool_down_timer.start()


func _on_attack_cool_down_timer_timeout():
	# cool down period is over so player may attack again
	player_cool_down = false


func _on_enemy_hitbox_area_entered(area):
	print("area entered")
	process_player_attack()
