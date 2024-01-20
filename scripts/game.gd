extends Node2D

var player_lives = 3;
var points = 0;

@onready var player = $Player
@onready var ui = $UI
@onready var hud = $UI/HUD 
@onready var enemy_hit_sound = $EnemyHitSound
@onready var player_explode_sound = $PlayerExplodeSound

const GAME_OVER_SCENE = preload("res://scenes/game_over_screen.tscn")

func _ready():
	update_hud()
	
func update_hud():
	hud.update_score(points)
	hud.update_lives(player_lives)

func _on_deathzone_area_entered(area):
	print("Enemy entered death zone.")
	area.destroy()
	lose_life()

func _on_player_took_damage():
	print("Player took damage.")
	lose_life()

func lose_life():
	player_lives -= 1
	
	if player_lives >= 0:
		print("Player lost a life.")
		update_hud()
	
	if player_lives == 0:
		print("Game over.")
		player_explode_sound.play()
		player.die()
		show_game_over_screen()
	else:
		print("Remaning lives: ", player_lives)

func _on_enemy_died():
	print("Enemy died. Will grant points.")
	points += 100
	update_hud()
	print("Current points: ", points)
	enemy_hit_sound.play()

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	print("Enemy spawned.")
	add_child(enemy_instance)
	enemy_instance.connect("died", _on_enemy_died)

func show_game_over_screen():
	await get_tree().create_timer(1).timeout
	var game_over_scene_instance = GAME_OVER_SCENE.instantiate()
	game_over_scene_instance.set_score(points)
	ui.add_child(game_over_scene_instance)

func _on_game_over_screen_quit_pressed():
	pass # Replace with function body.

func _on_game_over_screen_retry_pressed():
	pass # Replace with function body.
