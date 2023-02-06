extends StaticBody


func _on_DialogueTriggerer_area_entered(_area):
	$CollisionShape.disabled = false
	
