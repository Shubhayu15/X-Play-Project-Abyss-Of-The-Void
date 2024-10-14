extends Node3D

@onready var npc_name: Label = $"../Dialogue/Text/Name"
@onready var dialogue: Label = $"../Dialogue/Text/Dialogue"
@onready var dialogue_bg: Control = $"../Dialogue"
@onready var talking: AudioStreamPlayer = $"../Talking"

var dialogue_lines = [
	"Hey, NewGuy! Thank goodness you're here.",
	"Listen, I hate to dump this on you, but I need your "+"\nhelp ASAP.",
	"We've got a serious situation - the power generator "+"\ncore just blew up.",
	"I need you to head over to the power generator and flip "+"\non the backup switch. Can you handle that?",
	"On your way, find the guard and ask them for access to "+"\nthe storage room. We might need supplies.",
	"Oh, and one more thing - ask the guard if we're in any "+"\nimmediate danger.",
	"If we are, tell them to initiate Code 'Genesis' and call "+"\nfor backup. Got all that?",
	"Alright, no time to waste. Get moving, and... good luck!",
	"...",
	"Stay safe out there, NewGuy. We're counting on you.",
	"This one line won't come"
]
var current_line = 0

func _ready() -> void:
	dialogue_bg.hide()
	pass

func _on_npc_interacted(_body: Variant) -> void:
	if Input.is_action_just_pressed("query"):
		if current_line == 0:
			dialogue_bg.show()
			talking.play()
			npc_name.text = "Captain"
		
		dialogue.text = dialogue_lines[current_line]
		
		current_line += 1
		if current_line >= dialogue_lines.size():
			current_line = 0
			talking.stop()
			dialogue_bg.hide()
			npc_name.text = ""
