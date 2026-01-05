extends Node
enum FrameTypes{
	BUTTERFLY,
	FLOWER,
	BEETLE
}

var x_viewport_length
var y_viewport_length
var film_amount
var moneys
var flower_spawn_count
var butterfly_spawn_count
var beetle_spawn_count
var film_cost
var bfly_cost
var fert_cost
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_var()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func reset_var():
	Global.film_amount = 1
	Global.moneys = 0
	Global.flower_spawn_count = 70
	Global.butterfly_spawn_count = 15
	Global.beetle_spawn_count = 15
	Global.film_cost = 3.99
	Global.bfly_cost = 30
	Global.fert_cost = 20
