extends Sprite2D
var game_scene:PackedScene = load("res://scenes/game.tscn")
@onready var film_btn: Button = $"../film upgrade/film btn"
@onready var bfly_btn: Button = $"../one with the butterflies upgrade/butterfly btn"
@onready var fert_btn: Button = $"../fertilizer/fert btn"
@onready var buy_sound: AudioStreamPlayer2D = $"../../Buy Sound"
@onready var exit_shop: Button = $"ui layer/Node/exit shop"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	film_btn.text = "$" + str(int(floor(Global.film_cost)))
	bfly_btn.text = "$" + str(int(floor(Global.bfly_cost)))
	fert_btn.text = "$" + str(int(floor(Global.fert_cost)))

func _on_film_btn_pressed() -> void:
	if (Global.moneys >= int(floor(Global.film_cost))):
		Global.film_amount += 2
		Global.moneys -= int(floor(Global.film_cost))
		if (Global.film_cost <= 10):
			Global.film_cost *= 1.051
		elif (Global.film_cost <= 30):
			Global.film_cost *= 1.031
		else:
			Global.film_cost *= 1.011
		buy_sound.play()

func _on_butterfly_btn_pressed() -> void:
	if (Global.moneys >= int(floor(Global.bfly_cost))):
		Global.butterfly_spawn_count = int(Global.butterfly_spawn_count*1.4)
		print("butterfly spawning ", str(Global.butterfly_spawn_count))
		Global.moneys -= int(floor(Global.bfly_cost))
		if (Global.bfly_cost <= 300):
			Global.bfly_cost *= 1.811
		elif (Global.bfly_cost <= 800):
			Global.bfly_cost *= 1.511
		else:
			Global.bfly_cost *= 1.311
		buy_sound.play()

func _on_fert_btn_pressed() -> void:
	if (Global.moneys >= int(floor(Global.fert_cost))):
		Global.flower_spawn_count = int(Global.flower_spawn_count*1.25)
		print("flower_spawning " + str(Global.flower_spawn_count))
		Global.moneys -= int(floor(Global.fert_cost))
		if (Global.fert_cost <= 200):
			Global.fert_cost *= 1.711
		elif (Global.fert_cost <= 500):
			Global.fert_cost *= 1.311
		else:
			Global.fert_cost *= 1.111
		buy_sound.play()

func _on_exit_shop_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)
