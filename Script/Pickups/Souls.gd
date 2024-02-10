extends RigidBody2D


func _on_area_entered(area):
	var random = RandomNumberGenerator.new()
	random.randomize()
	if area.is_in_group("Collector"):
		player_data.Souls  += random.randi_range(0, 2)
		queue_free()
