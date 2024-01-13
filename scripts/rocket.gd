extends Area2D

@export var SPEED = 600

func _physics_process(delta):
	global_position.x += delta * SPEED
	pass
