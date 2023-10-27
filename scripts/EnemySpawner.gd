extends Node2D

@export var enemy_tscm: PackedScene
@export var spawner_height = -50
@onready var timer = $Timer

func _process(delta):
	if (GameState.score == 100):
		timer.wait_time = 0.75
		print("wait timer is 0.75")
	if (GameState.score == 500):
		timer.wait_time = 0.5
		print("now its 0.5")
	if (GameState.score == 1000):
		timer.wait_time = 0.25

func spawn_enemy_ship():
	var enemy = enemy_tscm.instantiate()
	self.add_child(enemy)
	var viewport_width = get_viewport_rect().size.x
	var viewport_height = get_viewport_rect().size.y
	enemy.position.x = randi_range(0, viewport_width)
