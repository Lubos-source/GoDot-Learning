extends StaticBody2D

@export var item: InvItem
var player = null


func _on_interactable_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		#print("player picked up ballon")
		player = body
		# call player collect function
		playercollect()
		# discard item from scene
		self.queue_free()
		
func playercollect():
	# call collect function inside player
	player.collect(item)
