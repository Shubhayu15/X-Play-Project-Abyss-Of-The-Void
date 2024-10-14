extends Node3D


const SCENE_1 = preload("res://Scenes/Main/credits.tscn")

func _process(_delta: float) -> void:
	if Input.is_action_just_released("enter"):
		get_tree().change_scene_to_packed(SCENE_1)

func _next_scene(_delta: float) -> void:
	#if Input.is_action_just_released("enter"):
	get_tree().change_scene_to_packed(SCENE_1)
