extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(Global.film_amount)
	if Global.film_amount == 0:
		set("theme_override_colors/default_color", Color(255,0,0))
	else:
		set("theme_override_colors/default_color", Color(255,255,255))
