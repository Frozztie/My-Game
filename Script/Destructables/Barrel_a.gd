extends StaticBody2D

@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play("Static_B")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_hit_box_area_entered(area):
	if area.name == "HurtBox":
		anim.play("Destroyed")
		await anim.animation_finished
		anim.play("Static_D")
