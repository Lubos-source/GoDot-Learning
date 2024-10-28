extends Control

var is_open = false 

# preload players inventory
@onready var inv: Inv = preload("res://inventory/player_inv.tres")
# get all inv slots inside grid
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inv.update.connect(update_slots)
	update_slots()
	close()

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])

func open():
	visible = true
	is_open = true
	
func close():
	visible = false
	is_open = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("interact"):
	#	if is_open:
	#		close()
	#	else:
	#		open()
	pass
