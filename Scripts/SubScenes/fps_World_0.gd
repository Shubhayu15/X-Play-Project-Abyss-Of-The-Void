extends Node3D

@onready var hitrect: TextureRect = $Control/Hitrect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hitrect.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_released('reset_scene'):
		get_tree().change_scene_to_packed(preload("res://Scenes/Main/scene_4.tscn"))
	pass

func _on_player_fps_player_hit() -> void:
	hitrect.visible = true
	await get_tree().create_timer(0.2).timeout
	hitrect.visible = false
	pass # Replace with function body.
