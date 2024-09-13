extends Node

const SCORES_PATH = "user://tappy.dat"

var _score: int = 0
var _high_score: int = 0

func _ready():
	load_high_score()

func get_score():
	return _score
	
func get_high_score():
	return _high_score

func set_score(v: int):
	_score = v
	if _score > _high_score:
		_high_score = _score
	SignalManager.on_score_updated.emit(_score)
	
func increment_score():
	set_score(_score + 1)
	
func load_high_score():
	var file: FileAccess = FileAccess.open(SCORES_PATH, FileAccess.READ)
	if file:
		if file.get_length() > 0:
			_high_score = file.get_32()
			print("Loaded high score")
			file.close()
	else:
		print("FAILED to load file")
		
func save_high_score_to_file():
	var file: FileAccess = FileAccess.open(SCORES_PATH, FileAccess.WRITE)
	if file:
		file.store_32(_high_score)
		file.close()
	
