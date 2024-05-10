extends Area2D

func _ready():
	# Connect the signal to this script
	connect("body_entered", Callable(self, "_on_Area2D_area_entered"))

func _on_Area2D_area_entered(area):
	if area.name == "Player":  # Check if the collider is the player
		var sprite = $"../blue_x"  # Get the Sprite node
		# Check if the current texture is RED_X_.png
		if sprite.texture.resource_path == "res://UI/RED_X_.png":
			# Since it's RED_X_, reload the scene
			reload_current_scene()
		else:
			# If it's not RED_X_, change to RED_X_.png
			sprite.texture = preload("res://UI/RED_X_.png")
			Global.process_blue_inter()

func reload_current_scene():
	# Reload the current scene
	get_tree().reload_current_scene()
