extends Sprite2D


@onready var game_manager: Node2D = $"../Game Manager"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Replace with function body.
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = get_global_mouse_position()
	
