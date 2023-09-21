extends State

@export var ground_state:State
@export var double_jump_velocity : float = -300
@export var jump_amount : int = 3

var current_jump_amount : int = 0
var has_double_jump : bool = false

func state_process(delta):
	if(character.is_on_floor()):
		next_state = ground_state
		
func state_input(event : InputEvent):
	if(event.is_action_pressed("Jump") && current_jump_amount < jump_amount):
		extra_jump()

func extra_jump():
	character.velocity.y = double_jump_velocity
	has_double_jump = true
	current_jump_amount += 1

func on_exit():
	if(next_state == ground_state):
		has_double_jump = false
		current_jump_amount = 0
