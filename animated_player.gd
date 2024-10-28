extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

@export var inv: Inv


var speed = 200  # Nastav rychlost postavy
var direction = Vector2.ZERO

func _process(_delta):
	direction = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	
	velocity = direction * speed
	
	if Input.is_action_pressed("walk_right"):
		_animated_sprite.flip_h = false
		_animated_sprite.play("walk")
	elif Input.is_action_pressed("walk_left"):
		_animated_sprite.flip_h = true
		_animated_sprite.play("walk")
	elif (Input.is_action_pressed("walk_up") or Input.is_action_pressed("walk_down")):
		_animated_sprite.play("walk")
	else:
		_animated_sprite.stop()
		
	#if Input.is_action_just_pressed("ui_select"):
	#	print("Klávesa stisknuta")
		
	move_and_slide()

func collect(item):
	inv.insert(item)
	
func player():
	pass
