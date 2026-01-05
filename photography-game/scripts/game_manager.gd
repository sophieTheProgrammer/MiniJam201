extends Node2D
@onready var timer: Timer = $"../UI/earnings/Timer"
@onready var earnings: RichTextLabel = $"../UI/earnings"
@onready var flash_rect: ColorRect = $"../Flash Rect"
@onready var click: AudioStreamPlayer2D = $"../audio/click"
@onready var error: AudioStreamPlayer2D = $"../audio/error"
@onready var nono: AudioStreamPlayer2D = $"../audio/camera no no"
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
@onready var capture_timer: Timer = $"../frame/Capture Cooldown"

var can_capture = true
var game_over = false
const BUTTERFLY_VALUE = 2.1111
const FLOWER_VALUE = 1
const BEETLE_VALUE = -2
var frame_items = []
var fade = false
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
	if flash_rect.modulate.a >= 0:
		flash_rect.modulate.a -= .01
	if Global.moneys < floor(Global.film_cost) and Global.film_amount <= 0 and !game_over:
		game_over_timer.start()
		game_over = true
	if Input.is_action_just_released("click"):
		if (Global.film_amount >= 1):
			if (can_capture):
				#capture_timer.start()
				#can_capture = false
				click.play()
				Global.film_amount -= 1
				Global.moneys += count_items_in_frame()
				Global.moneys = max(Global.moneys, 0)
			else:
				nono.play()
		else:
			error.play()


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
	flash_rect.modulate.a = 1
	flash_rect.position = Vector2(mousePos.x- (frame.texture.get_width()*scale)/2, mousePos.y- (frame.texture.get_height()*scale)/2)
	flash_rect.size = Vector2(frame.texture.get_width()*frame.transform.get_scale().x, frame.texture.get_height()*frame.transform.get_scale().x)
	flash_rect.color = Color(255,255,255)
	flash_rect.modulate.a = 0.9
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
				beetleCount += 1
		money = int(ceil(butterflyCount * BUTTERFLY_VALUE)) + flowerCount * FLOWER_VALUE + beetleCount * BEETLE_VALUE
		earnings.text = "Earned " + str(money) + " dollars!\n"
	if butterflyCount > 0:
		earnings.append_text(str(butterflyCount) + " butterflies ($" + str(int(ceil(butterflyCount * BUTTERFLY_VALUE))) + ")\n")
	if flowerCount > 0:
		earnings.append_text(str(flowerCount) + " flowers ($" + str(flowerCount * FLOWER_VALUE) + ")\n")
	if beetleCount > 0:
		var temp = earnings
		earnings.append_text(str(beetleCount) + " beetle ")
		earnings.push_color(Color.RED)
		earnings.add_text("($" + str(beetleCount * BEETLE_VALUE) + ")")
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


func _on_capture_cooldown_timeout() -> void:
	can_capture = true
