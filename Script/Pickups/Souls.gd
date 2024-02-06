extends Area2D


func _on_area_entered(area):
	var random = RandomNumberGenerator.new()
	random.randomize()
	if area.name == "Collect":
		player_data.Souls  += random.randi_range(0, 2)
		queue_free()
