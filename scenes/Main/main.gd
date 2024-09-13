extends Control

@onready var highscore_label = $MarginContainer/HighscoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	highscore_label.text = str(ScoreManager.get_high_score())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("fly") == true:
		GameManager.load_gamescene()
