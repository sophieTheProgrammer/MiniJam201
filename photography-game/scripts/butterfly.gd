extends Node2D

@onready var move_timer: Timer = $MoveTimer
var x_viewport_length = 1152
var y_viewport_length = 648
var rand_x = position.x
var rand_y = position.y
var min_wait_time = 3
var max_wait_time = 7 - min_wait_time
var velocity = Vector2.ZERO
var min_speed = 3
var max_speed = 6 - min_speed
var speed = 4.0
const ACCELERATION = 4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = position.move_toward(Vector2(rand_x, rand_y), speed * 100 * delta)
	speed = move_toward(float(speed), 0.0, float(.01))

func _on_timer_timeout() -> void:
	rand_x = (randi() % x_viewport_length) - x_viewport_length/2
	rand_y = (randi() % y_viewport_length) - y_viewport_length/2
	speed = (randi() % max_speed) + min_speed
	move_timer.wait_time = (randi() % max_wait_time) + min_wait_time
	print("timer ended, new timer: ", move_timer.wait_time)
	print("new x, y: ", rand_x, ", ", rand_y)

	
