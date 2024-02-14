extends Node2D

@export var equipped_item: Equippable_Item:
	set(next_equipped):
		equipped_item = next_equipped
		self.texture = equipped_item.texture


func _on_area_2d_body_entered(body):
	if(body is Resource_Node):
		body.harvest()
		


