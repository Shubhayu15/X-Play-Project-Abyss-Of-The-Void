extends Node3D

@export var open = false

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var open_audio: AudioStreamPlayer3D = $"../Open"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_small_door_error_interacted(_body: Variant) -> void:
	open = !open
	
	if open:
		anim.play('Open')
		open_audio.play()
		#$"../CollisionShape3D".queue_free()
