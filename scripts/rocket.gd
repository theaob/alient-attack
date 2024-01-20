extends Area2D

@export var speed = 600

func _physics_process(delta):
	global_position.x += delta * speed

func _on_visible_on_screen_notifier_2d_screen_exited():
	print("Rocket left screen.")
	destroy()

func _on_area_entered(area):
	print("Rocket collided with enemy.")
	destroy()
	area.destroy()

func destroy():
	print("Rocket is destroyed.")
	queue_free()
