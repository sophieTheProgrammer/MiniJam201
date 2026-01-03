extends Node2D

const flowerFab = preload("res://scenes/flower.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_flower()

func spawn_flower():
	var row = 0
	
	for i in range(10):
		var curr = flowerFab.instantiate()
		curr.name = "flower"
		curr.position.x = row
		row += 100
		self.add_child(curr)
		Global.frame_items.append(curr)
	print(Global.frame_items)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("click"):
		print(count_items_in_frame())
func count_items_in_frame():
	var count = 0
	var mousePos = get_global_mouse_position()
	var mouseRect = Rect2(mousePos.x, mousePos.y, 2752*.05, 2064*.05)
	for item in Global.frame_items:
		var itemRect = Rect2(item.position.x, item.position.y, 592, 404)
		if mouseRect.intersects(itemRect):
			count+=1
	return count
