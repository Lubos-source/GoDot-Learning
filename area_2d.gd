extends Area2D

signal OnEnter
signal OnExit 

@onready var interaction_hint = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_hint.visible = false
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	interaction_hint.visible = true
	OnEnter.emit()
	

func _on_body_exited(body: Node2D) -> void:
	interaction_hint.visible = false
	OnExit.emit()
	#pass # Replace with function body.
