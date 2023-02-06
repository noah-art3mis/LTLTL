extends Spatial

func _on_DialogueHandler_destroy():
	queue_free()
