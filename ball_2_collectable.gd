extends StaticBody2D

@export var item: InvItem
var player = null


func _on_interactable_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		#print("player picked up ballon")
		player = body
		playercollect()
		self.queue_free()
		
func playercollect():
	player.collect(item)
