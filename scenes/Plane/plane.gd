extends CharacterBody2D

class_name Tappy

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
@onready var sound = $sound

const SPEED = 1000.0
const POWER = -350.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta	
	
	# Fly plane
	fly()
	
	# Start movement
	move_and_slide()
	
	if is_on_floor():
		die()

func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		animation_player.play("power")

func die():
	animated_sprite_2d.stop()
	sound.stop()
	set_physics_process(false)
	SignalManager.on_plane_died.emit()
	
