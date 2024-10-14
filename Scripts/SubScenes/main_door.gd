extends Node3D

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var open: AudioStreamPlayer3D = $Open

func _ready() -> void:
	# Remove this line to prevent automatic playing of 'Static' animation
	# anim.play('Static')
	pass

func _on_area_3d_body_entered(_body: Node3D) -> void:
	anim.play('Open')
	open.play()

func _on_area_3d_body_exited(_body: Node3D) -> void:
	anim.play('Close')
	open.play()
