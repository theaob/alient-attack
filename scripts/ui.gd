extends Control

@onready var score_label = $Score
@onready var lives_label = $Lives

func update_score(new_score):
	var score_string = str(new_score)
	score_label.set_text(score_string)

func update_lives(new_lives):
	var lives_string = "X " + str(new_lives)
	lives_label.set_text(lives_string)
