extends Node

const flowerFab = preload("res://scenes/flower.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_flower(10)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("click"):
		print("Left mouse button released.")

# spawns flowers in random location in certain range from origin
func spawn_flower(number_of_flowers):
	
	# set variables
	var row = 5
	var flowers_array = []

	# set the length of the viewport here when it is changed to panning
	var x_viewport_length = 1152
	var y_viewport_length = 648

	for i in range(number_of_flowers):
		var curr = flowerFab.instantiate()
		curr.name = "flower"
		
		curr.position.x = (randi() % x_viewport_length) - x_viewport_length/2
		curr.position.y = (randi() % y_viewport_length) - y_viewport_length/2
		self.add_child(curr)
		Global.frame_items.append(curr)
	print(Global.frame_items)
