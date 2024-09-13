extends Control

@onready var score_label = $ScoreLabel

func _ready():
	SignalManager.on_score_updated.connect(on_score_updated)


func on_score_updated(score: int):
	score_label.text = str(score)
