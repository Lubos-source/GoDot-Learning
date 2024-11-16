extends Node2D

var is_in_zone = false

@onready var inventory = $AnimatedPlayer/Inv_UI2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inventory.close()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# interakce s inventarem jen pokud je v dane area
	#if is_in_zone and Input.is_action_just_pressed("interact"):
	#	if inventory.is_open:
	#		inventory.close()
	#	else:
	#		inventory.open()
	# interakce s inventarem kdekoliv
	if Input.is_action_just_pressed("interact"):
		if inventory.is_open:
			inventory.close()
		else:
			inventory.open()


func _on_area_2d_on_enter() -> void:
	is_in_zone = true
	print("Player Entered Area")

func _on_area_2d_on_exit() -> void:
	is_in_zone = false
	inventory.close()

func _on_coin_pick_up() -> void:
	print("Player picked up coin")
