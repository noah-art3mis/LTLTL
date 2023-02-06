extends Node

onready var player = get_parent().get_node("Player")

func _on_DialogueHandler_next_level():
	end_level()

func _on_bounds_trigger_body_entered(body):
	if body == player:
		end_level()

func end_level():
	$sfx_end_of_level.play()
	$sfx_end_of_level/timer_end_of_level.start()
	
func _on_timer_end_of_level_timeout():
	change_level()

#debug functions to reload or end level on key press
func _input(event):
	if event.is_action_pressed("reload"):
		reload_level()
	if event.is_action_pressed("next_level"):
		end_level()
		
#actual code
func reload_level():
	var current_level = get_tree().current_scene.name #name of root node
	get_tree().change_scene("res://levels/" + current_level + "/" + current_level + ".tscn")
	
func change_level():
	var current_level = get_tree().current_scene.name #name of root node
	var next_level = get_next_level_name(current_level, "level_", "level_%s")
	get_tree().change_scene("res://levels/" + next_level + "/" + next_level + ".tscn")
	
func get_next_level_name(name, prefix, placeholder):
	var index
	if name.begins_with(prefix):
		index = name.trim_prefix(prefix)
	else:
		print_debug("error: wrong prefix on next level")
	
	index = int(index)
	index = index % 21 #loops if last level
	index += 1
	index = str(index)
	
	var result = placeholder % index
	print(name + " -> " + result)
	return result







