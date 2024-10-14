extends Area3D

@onready var u_ictrl: Sprite2D = $UIctrl

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	u_ictrl.show()
	pass # Replace with function body.

func _on_body_exited(_body: Node3D) -> void:
	u_ictrl.hide()
	pass # Replace with function body.
