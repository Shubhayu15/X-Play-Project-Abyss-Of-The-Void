extends Node3D


@export var red = false
@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var amongus: AudioStreamPlayer = $"../Amongus"


func _on_red_interacted(_body: Variant) -> void:
	red = !red
	
	if red:
		anim.play('red')
		amongus.play()
	pass # Replace with function body.
