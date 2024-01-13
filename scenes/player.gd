extends CharacterBody2D

const SPEED = 400

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
	
	pass
