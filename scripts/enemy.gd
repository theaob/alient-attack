extends Area2D

@export var speed = 400

signal died

func _physics_process(delta):
	global_position.x -= delta * speed

func destroy():
	print("Enemy is destroyed.")
	queue_free()
	
func die():
	print("Enemy is killed.")
	emit_signal("died")
	destroy()

func _on_body_entered(body):
	print("Enemy collided with player.")
	body.takeDamage()
	destroy()
