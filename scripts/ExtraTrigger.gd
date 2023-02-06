extends Trigger

#signal _entered
#func _ready():
#	var handler = get_tree().get_root().get_node("DialogueHandler")
#	connect("_entered", handler, "_on_DialogueTriggerer_area_entered")
#
#func _on_Area_area_entered(area):
#	if area.name == "DialogueTriggerer":
#		emit_signal("_entered")

onready var tween = get_node("Tween")
func destroy():
	tween.interpolate_property(self, "scale",
				Vector3(1, 1, 1), Vector3(0, 0, 0), 1,
				Tween.TRANS_CUBIC, Tween.EASE_OUT) #TODO randomize
	tween.start()
	print("trigger destroyed; animation plays")
