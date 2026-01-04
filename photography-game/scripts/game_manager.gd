extends Node2D
@onready var timer: Timer = $"../UI/earnings/Timer"
@onready var earnings: RichTextLabel = $"../UI/earnings"
@onready var click: AudioStreamPlayer2D = $"../audio/click"
@onready var error: AudioStreamPlayer2D = $"../audio/error"
@export var debug = false
@onready var shop_btn: Button = $"../UI/shop btn"
const flowerFab = preload("res://scenes/flower.tscn")
const butterflyFab = preload("res://scenes/butterfly.tscn")
const beetleFab = preload("res://scenes/beetle.tscn")
var upgrades_scene:PackedScene = load("res://scenes/upgrades.tscn")
var game_over_scene:PackedScene = load("res://scenes/game_over.tscn")
@onready var frame: Sprite2D = $"../frame"
@onready var camera_2d: Camera2D = $"../Camera2D"
@onready var game_over_timer: Timer = $"../gameovertimer"

var butterfly_value = 2.1111
var flower_value = 1
var frame_items = []
var fade = false
var game_over = false
func _ready() -> void:
	Audio.play_cont_music()
	Global.x_viewport_length = camera_2d.limit_right + abs(camera_2d.limit_left)
	Global.y_viewport_length = camera_2d.limit_bottom + abs(camera_2d.limit_top)
	spawn_flower(Global.flower_spawn_count)
	spawn_butterfly(Global.butterfly_spawn_count)
	spawn_beetle(Global.butterfly_spawn_count)
	
func _process(delta: float) -> void:
	if fade:
		earnings.modulate.a -= .01

	if Global.moneys < Global.film_cost and Global.film_amount <= 0 and !game_over:
		game_over_timer.start()
		game_over = true
	if Input.is_action_just_released("click"):
		if Global.film_amount > 0:
			click.play()
		else:
			error.play()
		if (Global.film_amount >= 1):
			Global.film_amount -= 1
			Global.moneys += count_items_in_frame()
			Global.moneys = max(Global.moneys, 0)


func count_items_in_frame():
	#makes 2 rects of the frame box and the frame item and then sees if they intersect
	#if they intersect then count is updated then it is returned at the end
	earnings.show()
	fade = false
	earnings.modulate.a = 1
	var butterflyCount = 0
	var flowerCount = 0
	var beetleCount = 0
	var mousePos = get_global_mouse_position()
	var money
	var scale = frame.transform.get_scale().x
	var mouseRect = Rect2(mousePos.x - (frame.texture.get_width()*scale)/2, mousePos.y - (frame.texture.get_height()*scale)/2, frame.texture.get_width()*scale, frame.texture.get_height()*scale)
	if debug:
		var mr = ColorRect.new()
		mr.position = Vector2(mousePos.x- (frame.texture.get_width()*scale)/2, mousePos.y- (frame.texture.get_height()*scale)/2)
		mr.size = Vector2(frame.texture.get_width()*frame.transform.get_scale().x, frame.texture.get_height()*frame.transform.get_scale().x)
		mr.color = Color(255,0,0)
		mr.modulate.a = .1
		add_child(mr)
	for item in frame_items:
		var tex = item.sprite
		var itemRect = Rect2(item.position.x - tex.texture.get_width()*tex.transform.get_scale().x/2, item.position.y - tex.texture.get_height()*tex.transform.get_scale().y/2, tex.texture.get_width()*tex.transform.get_scale().x, tex.texture.get_height()*tex.transform.get_scale().y)
		if mouseRect.intersects(itemRect):
			if debug:
				var ir = ColorRect.new()
				ir.position = Vector2(item.position.x - tex.texture.get_width()*tex.transform.get_scale().x/2, item.position.y - tex.texture.get_height()*tex.transform.get_scale().y/2)
				ir.size = Vector2(tex.texture.get_width()*tex.transform.get_scale().x, tex.texture.get_height()*tex.transform.get_scale().y)
				ir.color = Color(0,0,255)
				ir.modulate.a = .1
				add_child(ir)
			if item.type == Global.FrameTypes.BUTTERFLY:
				butterflyCount += 1
			elif item.type == Global.FrameTypes.FLOWER:
				flowerCount += 1
			elif item.type == Global.FrameTypes.BEETLE:
				beetleCount+=1
		money = butterflyCount * 4 + flowerCount - (beetleCount*2)
		earnings.text = "Earned " + str(money) + " dollars!\n"
	if butterflyCount > 0:
		earnings.append_text(str(butterflyCount) + " butterflies ($" + str(int(ceil(butterflyCount * butterfly_value))) + ")\n")
	if flowerCount > 0:
		earnings.append_text(str(flowerCount) + " flowers ($" + str(flowerCount) + ")\n")
	if beetleCount > 0:
		earnings.append_text(str(beetleCount) + " beetle ($-" + str(beetleCount*2) + ")")
	timer.start()
	return money
	
# spawns flowers in random location in certain range from origin
func spawn_flower(number_of_flowers):
	# set variables
	var row = 5

	for i in range(number_of_flowers):
		var curr = flowerFab.instantiate()
		curr.name = "flower"
		
		curr.position.x = (randi() % Global.x_viewport_length) - Global.x_viewport_length/2
		curr.position.y = (randi() % Global.y_viewport_length) - Global.y_viewport_length/2
		self.add_child(curr)
		frame_items.append(curr)
# spawns flowers in random location in certain range from origin

func spawn_butterfly(number_of_butterflies):
	# set variables
	var row = 5

	for i in range(number_of_butterflies):
		var curr = butterflyFab.instantiate()
		curr.name = "butterfly"
		curr.position.x = (randi() % Global.x_viewport_length) - Global.x_viewport_length/2
		curr.position.y = (randi() % Global.y_viewport_length) - Global.y_viewport_length/2
		self.add_child(curr)
		frame_items.append(curr)

func spawn_beetle(num):
	# set variables
	var row = 5

	for i in range(num):
		var curr = beetleFab.instantiate()
		curr.name = "beetle"
		curr.position.x = (randi() % Global.x_viewport_length) - Global.x_viewport_length/2
		curr.position.y = (randi() % Global.y_viewport_length) - Global.y_viewport_length/2
		self.add_child(curr)
		frame_items.append(curr)

func _on_shop_btn_pressed() -> void:
	get_tree().change_scene_to_packed(upgrades_scene)


func _on_timer_timeout() -> void:
	fade = true
	


func _on_gameovertimer_timeout() -> void:
	get_tree().change_scene_to_packed(game_over_scene)
