extends Node2D

@onready var Film_Amount_Label: RichTextLabel = $"CanvasLayer/Film Amount Label"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Film_Amount_Label.text = str(Global.film_amount)
