extends CharacterBody3D

@onready var head: Node3D = $Camera
@onready var anim: AnimationPlayer = $Camera/Camera3D/gun/AnimationPlayer
@onready var ray: RayCast3D = $Camera/Camera3D/RayCast3D
@onready var bullet_shoot_fire: AudioStreamPlayer = $BulletShootFire

var current_speed = 5.0
var walking_speed = 5.0
var crouching_speed = 2.5
var crouching_depth = 2.25
const SPRINTING_SPEED = 8.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENS = 0.25
const HIT_STAGGER = 8.0
var lerp_speed = 10.0
var direction = Vector3.ZERO

@warning_ignore("unused_signal")
signal player_hit

var bullet = preload("res://Scenes/SubScenes/bullet.tscn")
var instance

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * MOUSE_SENS))
		head.rotate_x(deg_to_rad(-event.relative.y * MOUSE_SENS))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89), deg_to_rad(89))

func _physics_process(delta: float) -> void:
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
	var input_dir = Input.get_vector("left", "right", "up", "down")
	direction = lerp(direction, (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(), delta * lerp_speed)
	
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)
	
	move_and_slide()
	
	if Input.is_action_pressed("shoot"):
		if !anim.is_playing():
			anim.play("Shoot")
			bullet_shoot_fire.play()
			instance = bullet.instantiate()
			instance.position = ray.global_position
			instance.transform.basis = ray.global_transform.basis
			get_parent().add_child(instance)

func hit(dir) -> void:
	emit_signal("player_hit")
	velocity += dir * HIT_STAGGER
