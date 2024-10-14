extends Node3D

@onready var task_log : Label = $Task
@onready var obj_1: Area3D = $OBJ1
@onready var collision_shape_3d: CollisionShape3D = $OBJ1/CollisionShape3D
@onready var collision_shape_3d_1: CollisionShape3D = $OBJ2/CollisionShape3D

func _ready() -> void:
	task_log.text = "Have the last Words..."

func _process(_delta: float) -> void:
	pass


func _on_obj_1_body_exited(_body: Node3D) -> void:
	task_log.text = "Find any Survivors and exit!"
	collision_shape_3d.queue_free()
	pass # Replace with function body.


func _on_obj_2_body_exited(_body: Node3D) -> void:
	task_log.text = "Get To the hangar!"
	collision_shape_3d_1.queue_free()
	pass # Replace with function body.
