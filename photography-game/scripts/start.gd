extends Node2D


const GAME = preload("res://scenes/game.tscn")
const TUTORIAL = preload("res://scenes/tutorial.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	Global.reset_var()
	get_tree().change_scene_to_packed(GAME)


func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_packed(TUTORIAL)
