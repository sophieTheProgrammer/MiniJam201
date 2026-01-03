extends Node

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
		print("Left mouse button released.")
