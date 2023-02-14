extends Control

func _input(event):
	if event is InputEventKey and event.pressed:
		get_tree().change_scene("res://levels/level_1/level_1.tscn")
