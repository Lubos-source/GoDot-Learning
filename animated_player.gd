extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var health_bar = $UI/Health_Bar

@export var inv: Inv

signal health_updated


var speed = 200  # Settings for speed of character
var direction = Vector2.ZERO # (0,0)

# setting up the health and its regeneration over time
var health = 100
var max_health = 100
var regen_health = 1

func _ready():
	health_updated.connect(health_bar.update_health_ui)
	

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
		# now just stoped frame of walk animation (to do -> add IDLE animation)
		#_animated_sprite.stop()
		
		# Run idle animation
		_animated_sprite.play("idle")
		
	# press SPACE to lose some health
	# just testing if health is updated right 
	# -5 -> emulates hiting
	if Input.is_action_just_pressed("ui_select"):
		print("pressed space")
		health = health - 50
		health_updated.emit(health, max_health)
	
	# call this for apply calculated movement
	move_and_slide()
	
	# regenrating health if is less then max
	var updated_healt = min(health + regen_health * _delta, max_health)
	# if the values are different, update health
	if updated_healt != health:
		health = updated_healt
		health_updated.emit(health, max_health)
	
func collect(item):
	inv.insert(item)
	
func player():
	pass
