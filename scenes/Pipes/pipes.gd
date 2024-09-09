extends Node2D

class_name Pipes

const OFF_SCREEN: float = -500.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= delta * GameManager.SCROLL_SPEED
	check_off_screen()

func check_off_screen():
	if position.x < OFF_SCREEN:
		queue_free()

func _on__screen_exited():
	queue_free()
