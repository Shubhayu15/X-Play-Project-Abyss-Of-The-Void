extends Node3D

@export var open = false

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var omni_light_3d: OmniLight3D = $OmniLight3D
@onready var pull_sound: AudioStreamPlayer3D = $"../PullSound"
@onready var coll_0: CollisionShape3D = $"../Teleporter/StaticBody3D/CollisionShape3D"
@onready var coll_1: CollisionShape3D = $"../Teleporter/StaticBody3D/CollisionShape3D3"
@onready var coll_2: CollisionShape3D = $"../Teleporter/StaticBody3D/CollisionShape3D4"



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
		coll_0.disabled = true
		coll_1.disabled = true
		coll_2.disabled = true
		$"../CollisionShape3D".queue_free()
		omni_light_3d.light_color = "#009215"
