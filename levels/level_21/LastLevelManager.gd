extends Node

onready var player = get_parent().get_node("Player")
onready var coin = get_parent().get_node("convo_trigger_extra")

func _process(delta):
	if player.transform.origin.y < -90:
		player.translate(Vector3(0,180,0))
		print("get back to the labyrinth")
	
#		reset_coin()
		

#func reset_coin():
#	coin.scale = Vector3(1,1,1)
#	var new_index = randi() % 10
#	new_index = new_index as String
#	coin.set_name("convo_trigger_" + new_index)
