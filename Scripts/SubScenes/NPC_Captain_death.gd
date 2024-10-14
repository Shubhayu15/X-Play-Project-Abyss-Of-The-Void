extends Node3D

@onready var npc_name: Label = $"../Dialogue/Text/Name"
@onready var dialogue: Label = $"../Dialogue/Text/Dialogue"
@onready var dialogue_bg: Control = $"../Dialogue"
@onready var talking: AudioStreamPlayer = $"../Talking"

var dialogue_lines = [
	"Argh! No... NO!",
	"It's... it's no use. I'm trapped here. But you... you can still "+"\nmake it!",
	"Listen up, rookie! There's an escape ship in the hangar. That's "+"\nyour ticket out of this nightmare!",
	"I've gotta stay behind... Someone needs to blow this ship to "+"\nkingdom come. It's the only way to stop them...",
	"What are you waiting for?! Every second counts! Get moving!",
	"Remember your training... and... and tell my family I...",
	"GO! NOW! Before it's too la--",
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
