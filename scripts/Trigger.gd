extends Area

class_name Trigger

func destroy():
	print("trigger freed")
	queue_free()
