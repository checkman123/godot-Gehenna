extends State

class_name GroundState

@export var jump_velocity : float = -300
@export var air_state : State
@export var jump_animation : String = "Jump"

func _physics_process(delta):
	# Add the gravity.
	if(!character.is_on_floor()):
		next_state = air_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("Jump")):
		jump()

func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)
