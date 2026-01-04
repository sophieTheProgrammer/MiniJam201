extends Node
enum FrameTypes{
	BUTTERFLY,
	FLOWER,
	BEETLE
}

var x_viewport_length
var y_viewport_length
var film_amount = 1
var moneys = 0
var flower_spawn_count = 30
var butterfly_spawn_count = randi() % 2 + 6
var film_cost = 2.99
var bfly_cost = 20
var fert_cost = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
