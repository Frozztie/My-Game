extends RigidBody2D


func _on_area_entered(area):
	print("Area entered!")
	var random = RandomNumberGenerator.new()
	random.randomize()
	
	if area.is_in_group("Collector"):
		player_data.Souls += random.randi_range(0, 2)
		area.queue_free()
#
#extends RigidBody2D
#
#func _ready():
	#$Area2D.connect("area_entered", self, "_on_area_entered")
#
##func _on_area_entered(area):
	##print("Area entered!")
	##var random = RandomNumberGenerator.new()
	##random.randomize()
	##
	##if area.is_in_group("Collector"):
		##player_data.Souls += random.randi_range(0, 2)
		##area.queue_free()
#
#
#
#func _on_area_2d_area_entered(area):
	#print("Area entered!")
	#var random = RandomNumberGenerator.new()
	#random.randomize()
	#
	#if area.is_in_group("Collector"):
		#player_data.Souls += random.randi_range(0, 2)
		#area.queue_free()
