extends Node

#func _ready():
#	find_level("some_test", "convo_trigger_", "timeline_%s")
	
func find_level(name, prefix, placeholder):
	var index
	if name.begins_with(prefix):
		index = name.trim_prefix(prefix)
	else:
		print("error: wrong prefix")
	
	var result = placeholder % index
	print(name -> result)
	return result
	
