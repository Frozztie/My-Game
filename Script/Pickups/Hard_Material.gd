extends RigidBody2D


func _on_area_entered(area):
	var random = RandomNumberGenerator.new()
	random.randomize()
	if area.is_in_group("Collector"):
		player_data.Hard_Material  += random.randi_range(1, 3)
		queue_free()
