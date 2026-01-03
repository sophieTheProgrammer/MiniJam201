extends Camera2D

var camera_move_speed = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_camera()
	pass
	
func move_camera():
	var x_moved = 0
	var y_moved = 0
	
	if Input.is_action_pressed("right_arrow"):
		x_moved += camera_move_speed
	if Input.is_action_pressed("left_arrow"):
		x_moved -= camera_move_speed
	if Input.is_action_pressed("down_arrow"):
		y_moved += camera_move_speed
	if Input.is_action_pressed("up_arrow"):
		y_moved -= camera_move_speed
		
	position.y += y_moved
	position.x += x_moved
