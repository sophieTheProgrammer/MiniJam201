extends Node2D
@onready var sprite: Sprite2D = $"Istockphoto-1482089054-612x612"

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var speed_x = (randi() % 250) + 50
	var speed_y = (randi() % 250) + 50
	position.x += speed_x * delta
	position.y += speed_y * delta
	if (position.x >= Global.x_viewport_length/2 + 100):
		position.x = -Global.x_viewport_length/2 - 100
	if (position.y >= Global.y_viewport_length/2 + 100):
		position.y = -Global.y_viewport_length/2 - 100
