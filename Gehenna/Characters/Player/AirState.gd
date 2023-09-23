extends State

@export var ground_state : State
@export var double_jump_velocity : float = -300
@export var extra_jump_amount : int = 2
@export var jump_animation : String = "Jump"
@export var fall_animation : String = "Fall"
@export var idle_animation : String = "Move" #Name from Animation Tree

var has_extra_jump : bool = true

func state_process(delta):
	if(character.is_on_floor()):
		playback.travel(idle_animation)
		next_state = ground_state
	elif(character.velocity.y > 0):
		playback.travel(fall_animation)
		
		
func state_input(event : InputEvent):
	if(event.is_action_pressed("Jump") && has_extra_jump):
		extra_jump()

func extra_jump():
	character.velocity.y = double_jump_velocity
	playback.travel(jump_animation)
	character.current_jump_amount += 1
	if(character.current_jump_amount >= extra_jump_amount):
		has_extra_jump = false 

func on_exit():
	if(next_state == ground_state):
		has_extra_jump = true
		character.current_jump_amount = 0
		playback.travel(idle_animation)
