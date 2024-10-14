extends Node3D

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var open: AudioStreamPlayer3D = $Open

func _on_area_3d_body_entered(_body: Node3D) -> void:
	anim.play('Open')
	open.play()
	pass # Replace with function body.


func _on_area_3d_body_exited(_body: Node3D) -> void:
	anim.play('Close')
	open.play()
	pass # Replace with function body.
