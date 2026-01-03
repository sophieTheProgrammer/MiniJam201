extends Node2D

const flowerFab = preload("res://scenes/flower.tscn")
const butterflyFab = preload("res://scenes/butterfly.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_flower(10)
	spawn_butterfly(3)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("click"):
		print(count_items_in_frame())

func count_items_in_frame():
	#makes 2 rects of the frame box and the frame item and then sees if they intersect
	#if they intersect then count is updated then it is returned at the end
	var count = 0
	var mousePos = get_global_mouse_position()
	var mouseRect = Rect2(mousePos.x, mousePos.y, 2752*.05, 2064*.05)
	for item in Global.frame_items:
		var itemRect = Rect2(item.position.x, item.position.y, 592, 404)
		if mouseRect.intersects(itemRect):
			count+=1
	return count

# spawns flowers in random location in certain range from origin
func spawn_flower(number_of_flowers):
	# set variables
	var row = 5
	var flowers_array = []

	for i in range(number_of_flowers):
		var curr = flowerFab.instantiate()
		curr.name = "flower"
		
		curr.position.x = (randi() % Global.x_viewport_length) - Global.x_viewport_length/2
		curr.position.y = (randi() % Global.y_viewport_length) - Global.y_viewport_length/2
		self.add_child(curr)
		Global.frame_items.append(curr)
	print(Global.frame_items)
# spawns flowers in random location in certain range from origin

func spawn_butterfly(number_of_butterflies):
	# set variables
	var row = 5
	var flowers_array = []

	for i in range(number_of_butterflies):
		var curr = butterflyFab.instantiate()
		curr.name = "butterfly"
		curr.position.x = (randi() % Global.x_viewport_length) - Global.x_viewport_length/2
		curr.position.y = (randi() % Global.y_viewport_length) - Global.y_viewport_length/2
		self.add_child(curr)
		Global.frame_items.append(curr)
	print(Global.frame_items)
