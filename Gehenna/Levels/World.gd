extends Node2D

@onready var Player : CharacterBody2D = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	var SelectedChar = Game.Characters[Game.PlayerSelect].instantiate()
	SelectedChar.global_position = Player.global_position
	Player.queue_free()
	get_tree().root.add_child(SelectedChar)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_inventory_gui_closed():
	get_tree().paused = false
	
func _on_inventory_gui_opened():
	get_tree().paused = true



