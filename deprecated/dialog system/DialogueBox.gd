extends Control

onready var text = $Label
onready var letter_timer = $letter_timer
onready var sentence_timer = $sentence_timer
onready var audio = $AudioStreamPlayer
var msg_queue: Array = []
var playing_convo = false
var audio_frequency = 1

var convo_1 = [
	"you can't go up there.",
	"why not.",
	"it's impossible.",
	"surely there is a way up?",
	"no there's not. trust me on this one.",
	"huh."
]

var convo_2 = [ 
"i see what you mean. there's a few steps missing. it might be a bit dangerous, but maybe we can get a ladder or something?",
"the stairs dont matter. going up there is impossible.",
"i dont understand.",
"there is nothing to be understood. understanding clouds truth.",
"what?",
"it is not meant to be understood. it doesnt mean anything. it just is.",
"...",
"the stairs are made of stone. surely somebody had to go and put it there?",
"no.",
"no?",
"nobody put those there.",
"?", "then how did they get there",
"its part of the Structure, you see. it was here before us and it will be here after us.",
"dude, this 'structure' is literally falling apart. i cant get up there because some of it collapsed. it's just a matter of building it up again",
"sigh. just don't try the impossible.",
]

var convos = [convo_1, convo_2]
var convo_index = 0

func _ready():
	hide()
	
func play_convo(conversation: Array) -> void:
	playing_convo = true
	show()
	msg_queue += conversation
	display_next_message()
	
func display_next_message():
	if msg_queue.size() > 0:
		text.text = msg_queue.pop_front()
		text.visible_characters = 0
		letter_timer.start()
	else:
		playing_convo = false
		hide()
		return	
			
func _on_letter_timer_timeout():
	if text.visible_characters < text.text.length():
		text.visible_characters += 1
		play_audio(audio_frequency, text.visible_characters)
		letter_timer.start()
	else:
		letter_timer.stop()
		sentence_timer.start()
		
func _on_sentence_timer_timeout():
	sentence_timer.stop()
	display_next_message()

func play_audio(frequency, n):
	if n % frequency == 0: #skip every n times
		audio.play()
		
#func _input(event):
#	if not timer.is_stopped():
#		if event is InputEventKey and event.is_action_pressed("ui_accept"):
#			text.visible_characters = text.bbcode_text.length()
#		else:
#			display_next_message()
	
#func _on_convo_trigger_1_body_entered(_body):
#	play_convo(convo_1)
#	get_tree().call_group("dialogue_triggers", "turn_off")
