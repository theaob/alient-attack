extends Area2D

@export var speed = 400

func _physics_process(delta):
	global_position.x -= delta * speed

func _on_visible_on_screen_notifier_2d_screen_exited():
	destroy()

func destroy():
	queue_free()
