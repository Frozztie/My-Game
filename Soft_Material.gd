extends RigidBody2D


func _on_area_entered(area):
	var random = RandomNumberGenerator.new()
	random.randomize()
	if area.name == "Pickup_Radius":
		player_data.Soft_Material  += random.randi_range(1, 3)
		queue_free()
