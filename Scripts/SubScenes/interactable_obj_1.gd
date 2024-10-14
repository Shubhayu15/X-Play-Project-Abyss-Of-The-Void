#class_name Interactble
#extends Area3D
extends StaticBody3D
#extends Node3D

var on = true

func interact():
	on = !on
	
	if on == true:
		$OmniLight3D.visible = true
	
	if on == false:
		$OmniLight3D.visible = false
	
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void:
	#pass
