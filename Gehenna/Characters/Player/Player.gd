extends CharacterBody2D


@export var speed : float = 200.0
@export var jump_velocity : float = -300.0

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite: Sprite2D = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO
var animation_locked : bool = false

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("Left","Right","Up","Down")
	
	if direction:
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	update_animation()
	update_facing_direction()
	
func update_animation():
	animation_tree.set("parameters/Move/blend_position", direction.x)
	
func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = true
	elif direction.x < 0:
		sprite.flip_h = false