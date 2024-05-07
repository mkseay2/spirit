extends CharacterBody2D

@export var speed = 100
@onready var anim = $AnimatedSprite2D
var enemy_in_attack_range = false
var enemy_cool_down = false
var prev_dir = "right"
var state = "move"


func _physics_process(_delta):
	match state:
		"move":
			move_state()
			move_and_slide()
		"attack":
			attack_state()
	
	process_enemy_attack()


func move_state():
	# uses the four arrow keys
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction.normalized() * speed
	
	if Input.is_action_just_pressed("ui_left"):
		anim.play("walk_left")
		prev_dir = "left"
	elif Input.is_action_just_pressed("ui_right"):
		anim.play("walk_right")
		prev_dir = "right"
	elif Input.is_action_just_pressed("ui_up"):
		anim.play("walk_up")
		prev_dir = "up"
	elif Input.is_action_just_pressed("ui_down"):
		prev_dir = "down"
		if (prev_dir == "up"):
			anim.play("walk_left")
	elif Input.is_action_just_pressed("attack"):
		state = "attack"


func attack_state():
	match prev_dir:
		"left":
			anim.play("attack_left")
		"right":
			anim.play("attack_right")
		"up":
			anim.play("attack_up")
		"down":
			anim.play("attack_left")
	state = "move"


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
	# the last second, then process the attack
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
