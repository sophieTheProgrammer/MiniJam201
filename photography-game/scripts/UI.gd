extends CanvasLayer

@onready var Film_Amount_Label: RichTextLabel = $"Film Amount Label"
@onready var Moneys_Label: RichTextLabel = $"Moneys Label"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Film_Amount_Label.text = str(Global.film_amount)
	Moneys_Label.text = str(Global.moneys)
