extends Node2D


#func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	#print("enter 1")


func _on_area_2d_body_entered(body):
	Global.process_coin_collection()
	queue_free()
