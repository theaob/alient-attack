extends CharacterBody2D

const SPEED = 400

const ROCKET_SCENE = preload("res://scenes/rocket.tscn")

@onready var rocket_container = $RocketContainer
@onready var rocket_shot_sound = $RocketShotSound

signal took_damage

var rockets_fired = 0

func _physics_process(_delta):
	
	var rightPressed = Input.is_action_pressed("move_right")
	var leftPressed = Input.is_action_pressed("move_left")
	var upPressed = Input.is_action_pressed("move_up")
	var downPressed = Input.is_action_pressed("move_down")
	
	var xVelocity = 0;
	var yVelocity = 0;
	
	if rightPressed: xVelocity += SPEED
	if leftPressed: xVelocity -= SPEED
	if upPressed: yVelocity -= SPEED
	if downPressed: yVelocity += SPEED
	
	velocity = Vector2(xVelocity,yVelocity)

	move_and_slide()
	
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)
	
func _process(_delta):
	var isFiring = Input.is_action_just_pressed("fire_rocket")
	if isFiring: shoot()
	
func shoot():
	var rocket_instance = ROCKET_SCENE.instantiate()
	
	rocket_container.add_child(rocket_instance)
	rocket_shot_sound.play()
	
	rockets_fired += 1
	
	rocket_instance.global_position.x = global_position.x + 80
	rocket_instance.global_position.y = global_position.y
	
func takeDamage():
	print("Player took damage.")
	emit_signal("took_damage")

func die():
	print("Player died.")
	queue_free()
