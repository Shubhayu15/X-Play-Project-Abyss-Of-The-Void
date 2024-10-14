extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_released('reset_scene'):
		get_tree().change_scene_to_packed(preload("res://Scenes/Main/scene_5.tscn"))
	pass
