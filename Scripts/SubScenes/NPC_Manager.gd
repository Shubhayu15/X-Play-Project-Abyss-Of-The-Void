extends Node3D

@onready var npc_name: Label = $"../Dialogue/Text/Name"
@onready var dialogue: Label = $"../Dialogue/Text/Dialogue"
@onready var dialogue_bg: Control = $"../Dialogue"
@onready var talking: AudioStreamPlayer = $"../Talking"

var dialogue_lines = [
	"Hey there! Hold up a second...",
	"What's going on? Are you lost or something?",
	"Oh, wait a minute! You're the new hire, aren't you? My bad!",
	"So, you're trying to get to the storage room, huh? What's the "+"\nrush?",
	"Word of warning - I heard the Merchant's hanging out in there. "+"\nBetween you and me, that guy can be a real piece of work.",
	"Anyway, don't let me keep you. Sorry for the confusion earlier. "+"\nGood luck in there!",
	"Oh, and if you run into any trouble, just give a shout. We look "+"\nout for each other around here.",
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
			npc_name.text = "Manager"
		
		dialogue.text = dialogue_lines[current_line]
		
		current_line += 1
		if current_line >= dialogue_lines.size():
			current_line = 0
			talking.stop()
			dialogue_bg.hide()
			npc_name.text = ""
