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
	Global.film_cost = int(ceil(Global.film_cost))
	Global.bfly_cost = int(ceil(Global.bfly_cost))
	Global.fert_cost = int(ceil(Global.fert_cost))
	film_btn.text = "$" + str(Global.film_cost)
	bfly_btn.text = "$" + str(Global.bfly_cost)
	fert_btn.text = "$" + str(Global.fert_cost)

func _on_film_btn_pressed() -> void:
	if (Global.moneys >= Global.film_cost):
		Global.film_amount += 2
		Global.moneys -= Global.film_cost
		Global.film_cost *= 1.266111
		buy_sound.play()

func _on_butterfly_btn_pressed() -> void:
	if (Global.moneys >= Global.bfly_cost):
		Global.butterfly_spawn_count = int(Global.butterfly_spawn_count*1.25)
		print("butterfly spawning ", str(Global.butterfly_spawn_count))
		Global.moneys -= Global.bfly_cost
		Global.bfly_cost *= 1.3111111
		buy_sound.play()

func _on_fert_btn_pressed() -> void:
	if (Global.moneys >= Global.fert_cost):
		Global.flower_spawn_count = int(Global.flower_spawn_count*1.25)
		print("flower_spawning " + str(Global.flower_spawn_count))
		Global.moneys -= Global.fert_cost
		Global.fert_cost *= 1.2811111
		buy_sound.play()

func _on_exit_shop_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)
