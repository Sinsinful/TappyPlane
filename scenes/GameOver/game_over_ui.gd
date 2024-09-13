extends Control

@onready var game_over_label = $GameOverLabel
@onready var space_label = $SpaceLabel
@onready var timer = $Timer
@onready var sound = $sound

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if space_label.visible and Input.is_action_just_pressed("fly"):
		GameManager.load_mainscene()

func on_plane_died():
	show()
	timer.start()
	sound.play()
	ScoreManager.save_high_score_to_file()

func _on_timer_timeout():
	game_over_label.hide()
	space_label.show()
