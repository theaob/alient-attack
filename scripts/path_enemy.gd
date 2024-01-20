extends Path2D

@onready var path_follow = $PathFollow2D
@onready var enemy = $PathFollow2D/Enemy

func _ready():
	path_follow.progress_ratio = 1

func _process(delta):
	path_follow.progress_ratio -= 0.25 * delta
	
	if path_follow.progress_ratio <= 0:
		queue_free()
