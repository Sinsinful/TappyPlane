extends Node
const MAIN = preload("res://scenes/Main/main.tscn")
const GAME = preload("res://scenes/game/game.tscn")
const SCROLL_SPEED: float = 120
const GROUP_PLANE: String = "Plane"

func load_gamescene():
	get_tree().change_scene_to_packed(GAME)
	
func load_mainscene():
	get_tree().change_scene_to_packed(MAIN)
