extends Node2D

func _process(delta):
	match Game.PlayerSelect:
		0:
			get_node("PlayerSelect").play("Player0")
		1:
			get_node("PlayerSelect").play("Player1")
		2:
			get_node("PlayerSelect").play("Player2")
		3:
			get_node("PlayerSelect").play("Player3")

func _on_left_pressed():
	if(Game.PlayerSelect > 0):
		Game.PlayerSelect -= 1


func _on_right_pressed():
	if(Game.PlayerSelect < 3):
		Game.PlayerSelect += 1


func _on_select_pressed():
	get_tree().change_scene_to_file("res://Levels/World.tscn")
