extends MeshInstance

func _on_Area_body_entered(body):
	$StaticBody2/CollisionShape.disabled = true
