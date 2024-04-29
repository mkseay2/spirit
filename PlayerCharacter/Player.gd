extends CharacterBody2D

@export var speed = 100
var enemy_in_attack_range = false
var enemy_cool_down = false

func get_input():
	# uses the four arrow keys
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction.normalized() * speed


func _physics_process(_delta):
	get_input()
	move_and_slide()
	process_enemy_attack()


func player():
	pass


func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_in_attack_range = true


func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_in_attack_range = false


func process_enemy_attack():
	# if the enemy is in the attack range and the enemy hasn't attacked in 
	# the last minute, then process the attack
	if (enemy_in_attack_range == true) and (enemy_cool_down == false):
		Global.player_health = Global.player_health - 10
		if (Global.player_health <= 0):
			# TODO: player is dead, restart level
			Global.player_alive = false
		else:
			# begin cool down period so enemy cannot spam attacks
			enemy_cool_down = true
			$attack_cool_down_timer.start()
			
		print(Global.player_health)


func _on_attack_cool_down_timer_timeout():
	# cool down period is over so enemy may attack again
	enemy_cool_down = false
