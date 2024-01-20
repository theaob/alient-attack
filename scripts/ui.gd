extends Control

@onready var score_label = $Score

func update_score(new_score):
	var score_string = "SCORE: " + str(new_score)
	score_label.set_text(score_string)
