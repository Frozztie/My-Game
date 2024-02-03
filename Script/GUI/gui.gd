extends CanvasLayer

@onready var player = $Player

const HEART_ROW_SIZE = 8
const HEART_OFFSET = 16


func _ready():
	for i in player_data.health:
		var new_heart = Sprite2D.new()
		new_heart.texture = $Heart.texture
		new_heart.hframes = $Heart.hframes
		$Heart.add_child(new_heart)

func _process(_delta):
	$Coin_Number.text = var_to_str(player_data.coins)
		
	for heart in $Heart.get_children():
		var index = heart.get_index()
		var x = (index % HEART_ROW_SIZE) * HEART_OFFSET
		var y = (index / HEART_ROW_SIZE) * HEART_OFFSET
		heart.position = Vector2(x, y)
	
		var last_heart = floor(player_data.health)
		if index > last_heart:
			heart.frame = 4
		if index == last_heart:
			heart.frame = (player_data.health - last_heart) * 4
		if index < last_heart:
			heart.frame = 0
