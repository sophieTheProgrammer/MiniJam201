extends Node2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var move_timer: Timer = $MoveTimer

var rand_x = position.x
var rand_y = position.y
var min_wait_time = 1
var max_wait_time = 5 - min_wait_time
var velocity = Vector2.ZERO
var min_speed = 2
var max_speed = 4 - min_speed
var speed = 4.0
const ACCELERATION = 4
const type = Global.FrameTypes.BUTTERFLY
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_timer.start()
	look_at(Vector2(rand_x, rand_y))
	self.rotate(PI/2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = position.move_toward(Vector2(rand_x, rand_y), speed * 100 * delta)

func _on_timer_timeout() -> void:
	rand_x = (randi() % Global.x_viewport_length) - Global.x_viewport_length/2
	rand_y = (randi() % Global.y_viewport_length) - Global.y_viewport_length/2
	speed = (randi() % max_speed) + min_speed
	move_timer.wait_time = (randi() % max_wait_time) + min_wait_time
	look_at(Vector2(rand_x, rand_y))
	self.rotate(PI/2)
	#print("timer ended, new timer: ", move_timer.wait_time)
	#print("new x, y: ", rand_x, ", ", rand_y)

	
