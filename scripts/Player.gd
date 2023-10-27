extends Node2D

signal shot

@export var laser_tscm: PackedScene
@onready var audio_player = $AudioStreamPlayer

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	Input.set_custom_mouse_cursor(preload("res://sprites/t.png"))

func _process(delta):

	var mouse_pos = get_global_mouse_position().x
	position.x = mouse_pos
	
	if Input.is_action_just_pressed("fire"):
		var laser = laser_tscm.instantiate()
		add_sibling(laser)
		laser.position = self.position
		audio_player.play()

func _on_area_entered(area):
	if area.is_in_group("enemy"):
		self.queue_free()
		GameState.is_game_over = true
