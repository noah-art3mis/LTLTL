extends AudioStreamPlayer

export(Array, AudioStream) var audio_files: Array

export(float, 0, 0.5) var pitch_range_factor = 0.2
export(float, 0.5, 4) var pitch_factor = 0.75

onready var array_size = audio_files.size()
	
func play(from_position = 0.0):
	randomize()
	randomize_stream(array_size)
	randomize_pitch()
	stop()
	.play(from_position)

func randomize_stream(_array_size) -> void:
	if stream == null: stream = audio_files[randi() % _array_size]

func randomize_pitch() -> void:
	var _min = pitch_factor - pitch_range_factor
	var _max = pitch_factor + pitch_range_factor
	pitch_scale = rand_range(_min, _max)
	pitch_scale = max(pitch_scale, 0.01)
