extends Area2D


func _on_area_entered(area):
	var random = RandomNumberGenerator.new()
	random.randomize()
	if area.name == "Collect":
		player_data.coins  += random.randi_range(10, 25)
		print(player_data.coins)
		queue_free()


		player_data.health -= 1
		print(player_data.health)
