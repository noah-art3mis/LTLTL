extends Spatial

func _on_DialogueTriggerer_area_entered(area):
	queue_free()
