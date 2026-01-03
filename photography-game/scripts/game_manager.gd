extends Node2D


const flowerFab = preload("res://scenes/flower.tscn")
const butterflyFab = preload("res://scenes/butterfly.tscn")

@onready var frame: Sprite2D = $"../frame"
@onready var camera_2d: Camera2D = $"../Camera2D"



func _ready() -> void:
	Global.x_viewport_length = camera_2d.limit_right + abs(camera_2d.limit_left)
	Global.y_viewport_length = camera_2d.limit_bottom + abs(camera_2d.limit_top)
	spawn_flower(30)
	spawn_butterfly(10)

func _process(delta: float) -> void:
	if Input.is_action_just_released("click"):
		if (Global.film_amount >= 1):
			Global.film_amount -= 1
			print(count_items_in_frame())

func count_items_in_frame():
	#makes 2 rects of the frame box and the frame item and then sees if they intersect
	#if they intersect then count is updated then it is returned at the end
	var count = 0
	var mousePos = get_global_mouse_position()
	var flower = flowerFab.instantiate()
	var butterfly = butterflyFab.instantiate()
	var mouseRect = Rect2(mousePos.x, mousePos.y, frame.texture.get_width()*frame.transform.get_scale().x, frame.texture.get_height()*frame.transform.get_scale().x)
	for item in Global.frame_items:
		var tex = item.sprite
		var itemRect = Rect2(item.position.x, item.position.y, tex.texture.get_width()*tex.transform.get_scale().x, tex.texture.get_height()*tex.transform.get_scale().y)
		if mouseRect.intersects(itemRect):
			count+=1
	return count

# spawns flowers in random location in certain range from origin
func spawn_flower(number_of_flowers):
	# set variables
	var row = 5

	for i in range(number_of_flowers):
		var curr = flowerFab.instantiate()
		curr.name = "flower"
		
		curr.position.x = (randi() % Global.x_viewport_length) - Global.x_viewport_length/2
		curr.position.y = (randi() % Global.y_viewport_length) - Global.y_viewport_length/2
		self.add_child(curr)
		Global.frame_items.append(curr)
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
