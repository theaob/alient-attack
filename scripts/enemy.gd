extends Area2D

@export var speed = 400

func _physics_process(delta):
	global_position.x -= delta * speed

func destroy():
	queue_free()
