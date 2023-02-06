extends MeshInstance

func _on_Area_body_entered(body):
	$StaticBody2/CollisionShape.disabled = true
	$Timer.start()
	
signal end
func _ready():
	connect("end", get_parent().get_node("LevelManager"), "_on_DialogueHandler_next_level")
	
func _on_Timer_timeout():
	emit_signal("end")
	
