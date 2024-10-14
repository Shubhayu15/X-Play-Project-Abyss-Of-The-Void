class_name Interactable
extends StaticBody3D

@warning_ignore("unused_signal")
signal interacted(body)
@warning_ignore("unused_signal")
signal dialogue(body)

@export var prompt_message: String = "Interact"
@export var prompt_action: String = "interact"

func get_prompt() -> String:
	var key_name = ""
	var events = InputMap.action_get_events(prompt_action)
	
	
	for event in events:
		#key_name = event.as_text().split("(Physical)")[1]
		if event is InputEventKey:
			key_name = event.as_text()
			break
		elif event is InputEventMouseButton:
			key_name = "Mouse " + str(event.button_index)
			break
		elif event is InputEventJoypadButton:
			key_name = "Gamepad " + str(event.button_index)
			break
	
	return prompt_message + "\n[" + key_name + "]" if key_name else prompt_message

func interact(body):
	emit_signal("interacted", body)
	#print(body.name, "interacted!")

func dialogue_npc(body):
	emit_signal("dialogue", body)
