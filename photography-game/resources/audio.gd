extends AudioStreamPlayer2D

const one = preload("res://resources/Restful Piano Version 25168.mp3")
const two = preload("res://resources/Restful Piano - Sarah Spring.mp3")
const three = preload("res://resources/Equilibrium Brock Hewitt Stories in Sound Apr 13.mp3")
var rand
func play_music(music, volume):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match randi()%3:
		0:
			rand = one
		1:
			rand = two
		2:
			rand = three

func play_cont_music():
	play_music(rand, .4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
