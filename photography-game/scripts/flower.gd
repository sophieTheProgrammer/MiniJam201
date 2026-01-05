extends Node2D

@onready var sprite: Sprite2D = $Sprite2D
const type = Global.FrameTypes.FLOWER
@onready var timer: Timer = $"Despawn Timer"
var min_wait_time = 5
var max_wait_time = 30 - min_wait_time
var Despawn = false
var Respawn = false
const WHITE = preload("res://handdrawn/white.png")
const PURPLE = preload("res://handdrawn/purple.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#sprite.modulate = Color(randi () % 5, randi () % 5, randi () % 5)
	timer.wait_time = (randi() % max_wait_time) + min_wait_time
	timer.start()
	match randi()%3:
		0:
			sprite.texture = WHITE
		1:
			sprite.texture = PURPLE
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Despawn):
		sprite.scale *= 0.95
		if (sprite.scale <= Vector2(0.005, 0.005)):
			sprite.scale = Vector2(0.031/7.91782191212, 0.031/7.91782191212)
			self.translate(Vector2((randi() % Global.x_viewport_length) - Global.x_viewport_length/2, (randi() % Global.y_viewport_length) - Global.y_viewport_length/2))
			Despawn = false
			Respawn = true
	if (Respawn):
		if (sprite.scale >= Vector2(0.031, 0.31)):
			Respawn = false
		if (sprite.scale < Vector2(0.031, 0.031)):
			sprite.scale *= 1.03

func _on_despawn_timer_timeout() -> void:
	Despawn = true
