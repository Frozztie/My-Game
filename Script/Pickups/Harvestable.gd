extends StaticBody2D

class_name Resource_Node

@export var starting_resource: int = 1

var current_resources: int

func _ready():
	current_resources = starting_resource
