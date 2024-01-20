extends Node2D

func _on_deathzone_area_entered(area):
	print("Enemy entered death zone.")
	area.destroy()
