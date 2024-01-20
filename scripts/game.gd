extends Node2D

var player_lives = 3;
var points = 0;

@onready var player = $Player
@onready var hud = $UI/HUD 

func _on_deathzone_area_entered(area):
	print("Enemy entered death zone.")
	area.destroy()
	lose_life()

func _on_player_took_damage():
	print("Player took damage.")
	lose_life()

func lose_life():
	if player_lives > 0:
		print("Player lost a life.")
		player_lives -= 1
	
	if player_lives == 0:
		print("Game over.")
		player.die()
	else:
		print("Remaning lives: ", player_lives)

func _on_enemy_died():
	print("Enemy died. Will grant points.")
	points += 100
	hud.update_score(points)
	print("Current points: ", points)

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	print("Enemy spawned.")
	add_child(enemy_instance)
	enemy_instance.connect("died", _on_enemy_died)
