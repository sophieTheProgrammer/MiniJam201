extends Node

const flowerFab = preload("res://flower.tscn")
# Called when the node enters the scene tree for the first time.
var row = 5
func _ready() -> void:
	for i in range(3):
		var curr = flowerFab.instantiate()
		curr.name = "flower"
		curr.position.x = row
		row += 100
		self.add_child(curr)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("click"):
		print("Left mouse button released.")
