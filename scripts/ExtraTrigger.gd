extends Trigger

onready var tween = get_node("Tween")
onready var random_trans = randi() % 11
onready var triggered = false

func _ready():
	randomize()

#func destroy():
#	tween.interpolate_property(self, "scale",
#				self.scale, Vector3.ONE * 5, 2,
#				random_trans, Tween.EASE_OUT)
#	tween.start()
#	$CollisionShape.disabled = true
#
#func _on_Tween_tween_completed(object, key):
#	if scale > Vector3.ZERO:
#		tween.interpolate_property(self, "scale",
#					self.scale, Vector3(0, 0, 0), 2,
#					random_trans, Tween.EASE_OUT)
#		tween.start()
#		print("trigger destroyed")

func destroy():
	triggered = true
	$CollisionShape.disabled = true

func _process(delta):
	if triggered:
		scale = scale * 1.0015
