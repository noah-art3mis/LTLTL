extends ImmediateGeometry

#TODO set up inputs procedurally

#screenshot  functionality
func _input(event):
	if event.is_action_pressed("screenshot"):
		screenshot()
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
func screenshot():
	var image = get_viewport().get_texture().get_data()
	image.flip_y()

	var id = int(Time.get_unix_time_from_system()) as String
	var path = "user://" + id + ".png"
		
	image.save_png(path)
	print("took screenshot at " + ProjectSettings.globalize_path(path))
	
	
#debug draw functionality
func _process(_delta):
	self.clear()
	self.begin(PrimitiveMesh.PRIMITIVE_LINES)
	self.set_color(Color(1,1,1))
	self.add_vertex(start) 
	self.add_vertex(end)
	self.end()

onready var start : Vector3
onready var end : Vector3
func draw_line(_start, _end):
	start = _start
	end = _start + _end
