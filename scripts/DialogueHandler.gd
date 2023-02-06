extends Node

onready var prefix = "convo_trigger_"
onready var placeholder = "timeline_%s"

func _on_DialogueTriggerer_area_entered(area):
	if area.name.begins_with(prefix):
		
		#find number
		var convo_index = area.name.trim_prefix(prefix) # or _.substr(14)
		var convo = placeholder % convo_index # string format, not modulo operator
		print("now selected: " + convo)
		
		#play convo
		var new_dialog = Dialogic.start(convo)
		new_dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(new_dialog)
		
		area.destroy()
		
	elif area.name == "bounds_trigger":
		print("collided with bounds trigger")
	else:
		print("not a dialogue trigger. collider name: ", area.name) ##BUG  returns collider name instead of parent node name when colliding with the coin

signal destroy()
signal next_level()

func dialog_listener(string):
	match string:
		"destroy_ground":
			emit_signal("destroy")
		"change_level":
			emit_signal("next_level")
		_:
			print("error: no matching timeline end strings")
