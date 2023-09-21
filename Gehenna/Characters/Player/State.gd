extends Node

class_name State

@export var can_move : bool = true

var character : CharacterBody2D
var next_state : State = null

#Default if not override by child
func state_input(event : InputEvent):
	pass
	
func state_process(delta):
	pass

func on_enter():
	pass
	
func on_exit():
	pass
