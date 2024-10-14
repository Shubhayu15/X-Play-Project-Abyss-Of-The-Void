extends CharacterBody3D

@onready var head: Node3D = $Camera
@onready var uncrouch: CollisionShape3D = $Uncrouch
@onready var crouch: CollisionShape3D = $Crouch
@onready var ray_cast_3d: RayCast3D = $RayCast3D


var current_speed = 5.0
var walking_speed = 5.0
var crouching_speed = 2.5
var crouching_depth = 2.25
const SPRINTING_SPEED = 8.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENS = 0.25

var lerp_speed = 10.0

var direction = Vector3.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * MOUSE_SENS))
		head.rotate_x(deg_to_rad(-event.relative.y * MOUSE_SENS))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89), deg_to_rad(89))

func _physics_process(delta):
	
	if Input.is_action_pressed("crouch"):
		current_speed = crouching_speed
		head.position.y = lerp(head.position.y,3.75 - crouching_depth,delta*lerp_speed)
		uncrouch.disabled = true
		crouch.disabled = false
	#else:
	elif !ray_cast_3d.is_colliding():
		head.position.y = lerp(head.position.y,3.75,delta*lerp_speed)
		uncrouch.disabled = false
		crouch.disabled = true
		if Input.is_action_pressed("sprint"):
			current_speed = SPRINTING_SPEED
		else:
			current_speed = walking_speed
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	direction = lerp(direction,(transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(),delta*lerp_speed)
	
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)
	
	move_and_slide()
