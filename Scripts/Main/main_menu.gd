extends Node3D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(load("res://Scenes/Main/intro.tscn"))

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main/credits.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
