extends Node2D

const PIPES = preload("res://scenes/Pipes/pipes.tscn")

@onready var spawn_upper = $SpawnUpper
@onready var spawn_lower = $SpawnLower
@onready var spawn_timer = $SpawnTimer
@onready var pipes_holder = $PipesHolder

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_pipes() -> void:
	var new_pipes: Pipes = PIPES.instantiate()
	var yp: float = randf_range(spawn_upper.position.y, spawn_lower.position.y)
	new_pipes.position = Vector2(spawn_lower.position.x, yp)
	pipes_holder.add_child(new_pipes)


func _on_spawn_timer_timeout():
	spawn_pipes()
