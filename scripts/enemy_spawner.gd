extends Node2D

const ENEMY_SCENE = preload("res://scenes/enemy.tscn")
const PATH_ENEMY_SCENE = preload("res://scenes/path_enemy.tscn")

@onready var spawn_positions = $SpawnPositions.get_children()

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)

func _on_timer_timeout():
	spawn_enemy()
	
func _on_path_enemy_timer_timeout():
	spawn_path_enemy()

func spawn_enemy():
	var enemy_instance = ENEMY_SCENE.instantiate()
	var spawn_position = spawn_positions.pick_random()
	
	enemy_instance.global_position = spawn_position.global_position
	
	emit_signal("enemy_spawned", enemy_instance)

func spawn_path_enemy():
	var enemy_instance = PATH_ENEMY_SCENE.instantiate()
	emit_signal("path_enemy_spawned", enemy_instance)

