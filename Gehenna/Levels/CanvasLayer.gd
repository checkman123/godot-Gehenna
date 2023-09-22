extends CanvasLayer

@onready var inventory : Control = $InventoryGUI

func _ready():
	inventory.close()

func _input(event):
	if event.is_action_pressed("ToggleInventory"):
		if inventory.is_open:
			inventory.close()
		else:
			inventory.open()
			
