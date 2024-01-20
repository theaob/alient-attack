extends Control

signal retry_pressed
signal quit_pressed

func set_score(final_score):
	var score_string = "SCORE:" + str(final_score)
	$Panel/Score.set_text(score_string)

func _on_retry_button_pressed():
	emit_signal("retry_pressed")

func _on_quit_button_pressed():
	emit_signal("quit_pressed")
