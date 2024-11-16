extends ColorRect

@onready var value = $State


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# updates UI for health, sizing red frame to emulates losing
func update_health_ui(health, max_health):
	value.size.x = 98 * health / max_health
	
