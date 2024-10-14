extends CharacterBody3D

@export var player_path: NodePath
@export var SPEED: float = 4.0
@export var ATTACK_RANGE = 2.5
@export var health = 10

@onready var death_scream: AudioStreamPlayer = $DeathScream
@onready var scream: AudioStreamPlayer = $Scream


var player = null
var state_machine

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D
@onready var anim_tree: AnimationTree = $AnimationTree

func _ready() -> void:
	player = get_node(player_path)
	state_machine = anim_tree.get("parameters/playback")
	scream.play()

func _physics_process(delta: float) -> void:
	if player:
		match state_machine.get_current_node():
			"Run":
				nav_agent.set_target_position(player.global_position)
				var next_nav_point = nav_agent.get_next_path_position()
				velocity = (next_nav_point - global_position).normalized() * SPEED
				rotation.y = lerp_angle(rotation.y, atan2(-velocity.x, -velocity.z), delta * 10.0)
			"Attack":
				look_at(Vector3(player.global_position.x, global_position.y, player.global_position.z), Vector3.UP)
		
		anim_tree.set("parameters/conditions/attack", _target_in_range())
		anim_tree.set("parameters/conditions/run", !_target_in_range())
		
		move_and_slide()

func _target_in_range() -> bool:
	return global_position.distance_to(player.global_position) < ATTACK_RANGE

func _hit_finished() -> void:
	if global_position.distance_to(player.global_position) < ATTACK_RANGE + 1.0:
		var dir = global_position.direction_to(player.global_position)
		player.hit(dir)

func _on_area_3d_body_part_hit(damage: float) -> void:
	health -= damage
	if health <= 0:
		scream.stop()
		death_scream.play()
		anim_tree.set("parameters/conditions/die", true)
		await get_tree().create_timer(4.0).timeout
		queue_free()
