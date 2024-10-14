extends Node3D

@onready var npc_name: Label = $"../Dialogue/Text/Name"
@onready var dialogue: Label = $"../Dialogue/Text/Dialogue"
@onready var dialogue_bg: Control = $"../Dialogue"
@onready var talking: AudioStreamPlayer = $"../Talking"

var dialogue_lines = [
	"Hmm... You there! Are you the repair guy I've been waiting for?",
	"Well, don't just stand there gawking. Get your behind back "+"\nthere and fix the power! It's hotter than a furnace in here.",
	"Tell you what - if you can get that power back on quick, I "+"\nmight just have a job for you. How's that sound?",
	"Ha! I'm pulling your leg, kid. Who in their right mind would "+"\nhire you? You look like you'd struggle to screw in a light "+"\nbulb!",
	"Enough chit-chat! Get yourself into that room and fix the "+"\nblasted power already!",
	"Move it! Time is money, and right now, you're wasting both of "+"\nmine!",
	"And remember, if you break anything back there, it's coming out "+"\nof your nonexistent paycheck!",
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
