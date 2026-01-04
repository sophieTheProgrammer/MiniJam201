extends Node2D


const GAME = preload("res://scenes/game.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(GAME)
	Global.film_amount = 1
	Global.moneys = 0
	Global.flower_spawn_count = 30
	Global.butterfly_spawn_count = randi() % 2 + 6
	Global.film_cost = 1.88
	Global.bfly_cost = 3
	Global.fert_cost = 5


func _on_tutorial_pressed() -> void:
	print("switching to tutorial")
	pass # Replace with function body.
