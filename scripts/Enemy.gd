extends Area2D

@export var speed = mini(800, 100 + (GameState.score / 2))
@onready var hit_sound = $HitSound
@onready var deadzone_sound = $DeadzoneSound

func explode(sound):
		sound.play()
		$CollisionShape2D.set_deferred("disabled", true)
		self.visible = false
		await sound.finished
		self.queue_free()	

func _process(delta):
	self.position.y += speed * delta

func _on_area_entered(area):
	if area.is_in_group("player"):
		explode(hit_sound)
	if area.is_in_group("laser"):
		GameState.increase_score()
		explode(hit_sound)
	if area.is_in_group("deadzone"):
		GameState.decrease_score()
		explode(deadzone_sound)
