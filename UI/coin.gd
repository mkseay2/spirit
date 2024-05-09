extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	#print("enter 1")


func _on_area_2d_body_entered(body):
	Global.process_coin_collection()
	queue_free()
