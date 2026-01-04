extends Node2D

@onready var tutorial_label: RichTextLabel = $CanvasLayer/TutorialLabel
@onready var image_rect: Sprite2D = $Image
var current_step = 0

var tutorial_info = [
	{
		"text":"you are an avid nature photographer",
		"image_path":"res://handdrawn/tutorial/0.png"
	},
	{
		"text":"too bad you are BROKE!!!",
		"image_path":"res://handdrawn/tutorial/1.png"
	}
]
func _ready() -> void:
	current_step = 0
	loadTextFromIndex(0)
	loadImageFromIndex(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("click"):
		current_step += 1
		loadTextFromIndex(1)
		loadImageFromIndex(1)
	
func loadImageFromIndex(index):
	if not tutorial_info[index]["image_path"]:
		printerr("Image Texture Doesn't Exist")
	print(tutorial_info[index]["image_path"])
	image_rect.texture = load(tutorial_info[index]["image_path"])
func loadTextFromIndex(index):
	tutorial_label.text = tutorial_info[index]["text"]
