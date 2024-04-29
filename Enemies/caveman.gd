extends CharacterBody2D

# could increase speed per level to add difficulty
var speed = 0.9
var chase_player = false
var player = null

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
	pass # Replace with function body.


func _on_enemy_hitbox_body_exited(body):
	pass # Replace with function body.
