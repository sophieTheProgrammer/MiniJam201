extends Node

const flowerFab = preload("res://flower.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_flower()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_flower():
	var row = 5
	var flowers_array = []
	
	for i in range(10):
		var curr = flowerFab.instantiate()
		curr.name = "flower"
		curr.position.x = row
		row += 100
		self.add_child(curr)
