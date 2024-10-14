extends Node3D

@onready var npc_name: Label = $"../Dialogue/Text/Name"
@onready var dialogue: Label = $"../Dialogue/Text/Dialogue"
@onready var dialogue_bg: Control = $"../Dialogue"
@onready var talking: AudioStreamPlayer = $"../Talking"

var dialogue_lines = [
	"Argh... God, it hurts... But I won't... won't go down easy...",
	"Hey, rookie... Looks like this is... my final curtain call. "+"\nBut you've still got a show to run!",
	"Listen up! Those creatures... they're not invincible. Use the "+"\nexplosives... clear yourself a path outta here!",
	"What are you waiting for?! GO! NOW! Don't let my sacrifice be "+"\nin vain!",
	"Heh... hasta la vista, rookie. Show 'em what you're made of...",
	"And kid... it's been an honor...",
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
