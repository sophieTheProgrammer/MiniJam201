extends Node2D

@onready var tutorial_label: RichTextLabel = $CanvasLayer/TutorialLabel
@onready var image_rect: Sprite2D = $Image
@onready var start: Button = $start


var current_step = 0
const GAME = preload("res://scenes/game.tscn")

var tutorial_info = [
	{
		"text":"you are an avid nature photographer",
		"image_path":"res://handdrawn/tutorial/1.png"
	},
	{
		"text":"too bad you are BROKE!!!",
		"image_path":"res://handdrawn/tutorial/2.png"
	},
	{
		"text":"unfortunatly... you only have one film left in your camera",
		"image_path":"res://handdrawn/tutorial/3.png"
	},
	{
		"text":"luckily, people are willing to PAY for cool nature pics!",
		"image_path":"res://handdrawn/tutorial/4.png"
	},
	{
		"text":"they love flowers and butterflies",
		"image_path":"res://handdrawn/tutorial/5.png"
	},
	{
		"text":"watch out for bugs though...",
		"image_path":"res://handdrawn/tutorial/6.png"
	},
	{
		"text":"use WASD or the arrow keys to find your best shot",
		"image_path":"res://handdrawn/tutorial/7.png"
	},
	{
		"text":"click to shoot your photo once you are ready",
		"image_path":"res://handdrawn/tutorial/8.png"
	},
	{
		"text":"buy more film and upgrades at the shop",
		"image_path":"res://handdrawn/tutorial/9.png"
	},
	{
		"text":"good luck!",
		"image_path":"res://handdrawn/tutorial/10.png"
	}
]
func _ready() -> void:
	current_step = 0
	loadTextFromIndex(0)
	loadImageFromIndex(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("click"):
		if current_step == 10:
			print("switching to game...")
			get_tree().change_scene_to_packed(GAME)
		else:
			loadTextFromIndex(current_step)
			loadImageFromIndex(current_step)
		current_step += 1

		
			
func loadImageFromIndex(index):
	if not tutorial_info[index]["image_path"]:
		printerr("Image Texture Doesn't Exist")
	print(tutorial_info[index]["image_path"])
	image_rect.texture = load(tutorial_info[index]["image_path"])
func loadTextFromIndex(index):
	tutorial_label.text = tutorial_info[index]["text"]
