extends Node2D

var player_lives = 3;

@onready var player = $Player

func _on_deathzone_area_entered(area):
	print("Enemy entered death zone.")
	area.destroy()
	lose_life()

func _on_player_took_damage():
	lose_life()

func lose_life():
	print("Player lost a life.")
	player_lives -= 1;
	print("Remaning lives: ", player_lives)
	if player_lives == 0 :
		print("Game over.")
		player.die()
