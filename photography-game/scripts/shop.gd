extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_film_btn_pressed() -> void:
	Global.film_amount += 1
	


func _on_fert_btn_pressed() -> void:
	Global.flower_spawn_count = int(Global.flower_spawn_count*1.25)
	print("flower_spawning " + str(Global.flower_spawn_count))



func _on_butterfly_btn_pressed() -> void:
	Global.butterfly_spawn_count = int(Global.butterfly_spawn_count*1.25)
	print("butterfly spawning ", str(Global.butterfly_spawn_count))
