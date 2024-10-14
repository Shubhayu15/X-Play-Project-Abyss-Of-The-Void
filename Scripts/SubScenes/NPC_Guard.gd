extends Node3D

@onready var npc_name: Label = $"../Dialogue/Text/Name"
@onready var dialogue: Label = $"../Dialogue/Text/Dialogue"
@onready var dialogue_bg: Control = $"../Dialogue"
@onready var talking: AudioStreamPlayer = $"../Talking"

var dialogue_lines = [
	"Oi! You there! What's going on?",
	"Why's it so dark in here? Did you mess with something?",
	"Ugh... my head... Something's not right. I feel awful...",
	"Listen, I need you to do something. Head back to the generator "+"\nroom near storage, will ya?",
	"I'd go myself, but I can't squeeze through those vents like you "+"\ncan. Being scrawny has its perks, eh?",
	"Here, take this gun and be aware. I... I saw something weird in "+"\nthere earlier. We might be under attack, I dunno.",
	"Look, I know the Cap sent you to relay a message, but with the "+"\npower out, I can't do squat. We gotta fix this first.",
	"Oh, and uh... keep this between us, yeah? Don't tell the Cap "+"\nabout... y'know, how I'm feeling. Got it?",
	"What are you standing around for? Get moving! We don't have "+"\nall day!",
	"And whatever you do... be careful in there. Something's not "+"\nright...",
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
			npc_name.text = "Guard"
		
		dialogue.text = dialogue_lines[current_line]
		
		current_line += 1
		if current_line >= dialogue_lines.size():
			current_line = 0
			talking.stop()
			dialogue_bg.hide()
			npc_name.text = ""
