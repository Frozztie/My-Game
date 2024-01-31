extends Camera2D

@export var tilemap: TileMap

func _ready():
	var mapRect =  tilemap.get_used_rect()
	var tileSize = tilemap.cell_quadrant_size
	var worldSizeInpixels = mapRect.size * tileSize
	limit_right = worldSizeInpixels.x -0
	limit_bottom = worldSizeInpixels.y -0
	limit_left = 0  # Set the left limit to 0
	limit_top = 0   # Set the top limit to 0	

func _process(_delta):
	pass
