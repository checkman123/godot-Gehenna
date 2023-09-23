extends CharacterBody2D


@export var speed : float = 200.0
@export var inventory: Inventory

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite: Sprite2D = $Sprite2D
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var hurt_box : Area2D = $HurtBox


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO
var animation_locked : bool = false
var current_jump_amount : int = 0

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("Left","Right","Up","Down")
	
	if direction.x != 0 && state_machine.check_if_can_move():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	update_animation_parameters()
	update_facing_direction()

#---Handles Movement---
func update_animation_parameters():
	animation_tree.set("parameters/Move/blend_position", direction.x)
	
func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = true
	elif direction.x < 0:
		sprite.flip_h = false
#-----------------------
#---Handles HurtBox---
func _on_hurt_box_area_entered(area : Area2D):
	if area.has_method("collect"):
		area.collect(inventory)
#-----------------------

#---Handles inventory---
func _on_inventory_gui_closed():
	get_tree().paused = false


func _on_inventory_gui_opened():
	get_tree().paused = true
#-----------------------



