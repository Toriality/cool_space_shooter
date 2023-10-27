extends Node2D

@export var speed = 400

func _process(delta):
	position.y -= speed * delta

func _on_area_entered(area):
	if area.is_in_group("enemy"):
		self.queue_free()
