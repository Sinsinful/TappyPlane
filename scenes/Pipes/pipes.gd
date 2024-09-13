extends Node2D

class_name Pipes

const OFF_SCREEN: float = -500.0
@onready var score_sound = $ScoreSound

func _ready():
	SignalManager.on_plane_died.connect(on_plane_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= delta * GameManager.SCROLL_SPEED
	check_off_screen()

func check_off_screen():
	if position.x < OFF_SCREEN:
		queue_free()
		
func on_plane_died():
	set_process(false)

func _on__screen_exited():
	queue_free()


func _on_pipe_body_entered(body):
	if body is Tappy:
		body.die()
	#if body.is_in_group(GameManager.GROUP_PLANE) == true:
	#	body.die()


func _on_lazer_body_entered(body):
	if body is Tappy:
		score_sound.play()
		ScoreManager.increment_score()
