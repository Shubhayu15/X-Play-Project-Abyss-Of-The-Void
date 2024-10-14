extends Node3D

@onready var teleporter: Node3D = $"."

func _on_area_3d_body_entered(_body: Node3D) -> void:
	get_tree().change_scene_to_packed(preload("res://Scenes/Main/scene_5.tscn"))
