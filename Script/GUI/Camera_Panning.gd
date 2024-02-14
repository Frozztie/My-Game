extends Camera2D

@export var player: CharacterBody2D



func _process(_delta):
	position = player.position
	var x = floor(position.x / 320) * 320
	var y = floor(position.y / 180) * 180
	position = Vector2(x, y)
	var tween := create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position", Vector2(x, y), 0.14)
