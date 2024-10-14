extends Node

func _process(_delta: float) -> void:
	if Input.is_action_just_released('reset_scene'):
		get_tree().change_scene_to_packed(preload("res://Scenes/Main/scene_1.tscn"))
