extends Node

var score = 0
@export var score_modifier = 10
var is_game_over = false

func reset():
	score = 0
	is_game_over = false
	
func decrease_score():
	if !is_game_over:
		score -= score_modifier
	
func increase_score():
	if !is_game_over:
		score += score_modifier
	
func _process(delta):
	if score < 0:
		score = 0
		is_game_over = true
		
		
