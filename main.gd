extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_on_enter() -> void:
	print("Player Entered Area")

func _on_coin_pick_up() -> void:
	print("Player picked up coin")
