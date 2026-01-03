extends Node2D

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var speed_x = (randi() % 250) + 50
	var speed_y = (randi() % 250) + 50
	position.x += speed_x * delta
	position.y += speed_y * delta
