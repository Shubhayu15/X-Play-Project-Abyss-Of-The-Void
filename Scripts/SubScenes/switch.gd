extends Node3D

@export var open = false

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var omni_light_3d: OmniLight3D = $OmniLight3D
@onready var pull_sound: AudioStreamPlayer3D = $"../PullSound"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	omni_light_3d.light_color = "#a1000b"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_switch_interacted(_body: Variant) -> void:
	open = !open
	
	if open:
		anim.play('TurnON')
		pull_sound.play()
		$"../CollisionShape3D".queue_free()
		omni_light_3d.light_color = "#009215"
