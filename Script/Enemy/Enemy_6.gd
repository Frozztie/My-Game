extends Enemy_Movement


func _ready():
	random_generation()

func _on_timer_timeout():
	random_generation()
	$Timer.start

func _on_hitbox_area_entered(area):
	if area.is_in_group("HurtBox"):
		health -= 1
		flash()

func flash():
	$Sprite2D.material.set_shader_parameter("flash_modifier", 0.5)
	await get_tree().create_timer(0.3).timeout
	$Sprite2D.material.set_shader_parameter("flash_modifier", 0)
