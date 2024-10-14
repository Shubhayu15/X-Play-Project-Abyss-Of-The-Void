extends RayCast3D

@onready var prompt: Label = $Prompt

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_exception(owner)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	prompt.text = ""
	if is_colliding():
		var detected = get_collider()
		
		if detected is Interactable:
			#prompt.text = detected.name
			prompt.text = detected.get_prompt()
			
			if Input.is_action_just_pressed(detected.prompt_action):
				detected.interact(owner)
		#prompt.text = "Interact"
		#pass
		#print("Working")
	pass
