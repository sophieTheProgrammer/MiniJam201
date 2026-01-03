extends Sprite2D
var film_cost = 20
var bfly_cost = 20
var fert_cost = 20
var game_scene:PackedScene = load("res://scenes/game.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_film_btn_pressed() -> void:
	if (Global.moneys >= film_cost):
		Global.film_amount += 1
		Global.moneys -= film_cost

func _on_fert_btn_pressed() -> void:
	if (Global.moneys >= fert_cost):
		Global.flower_spawn_count = int(Global.flower_spawn_count*1.25)
		print("flower_spawning " + str(Global.flower_spawn_count))
		Global.moneys -= fert_cost

func _on_butterfly_btn_pressed() -> void:
	if (Global.moneys >= bfly_cost):
		Global.butterfly_spawn_count = int(Global.butterfly_spawn_count*1.25)
		print("butterfly spawning ", str(Global.butterfly_spawn_count))
		Global.moneys -= bfly_cost


func _on_exit_shop_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)
