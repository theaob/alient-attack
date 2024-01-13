extends Node2D

const ENEMY_SCENE = preload("res://scenes/enemy.tscn")
@onready var spawn_positions = get_node("SpawnPositions").get_children()

func _on_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var enemy_instance = ENEMY_SCENE.instantiate()
	add_child(enemy_instance)
	
	var spawn_position = spawn_positions.pick_random()
	
	enemy_instance.global_position = spawn_position.global_position
