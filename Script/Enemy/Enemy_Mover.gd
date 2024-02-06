extends CharacterBody2D
class_name Enemy_Movement

@export var speed = 20
@export var health = 3

@onready var anim = $Anim
@onready var dead_anim = preload("res://Scenes/Effects/dead_fx.tscn")
@onready var Soul_loot = preload("res://Scenes/Pickups/coins.tscn")


var current_states
enum enemy_states {MOVERIGHT, MOVELEFT, MOVEUP, MOVEDOWN, DEAD}

var dir
func _ready():
	random_generation()

func _physics_process(delta):
	if health <= 0:
		current_states = enemy_states.DEAD

	match current_states:
		enemy_states.MOVERIGHT:
			move_right()
		enemy_states.MOVELEFT:
			move_left()
		enemy_states.MOVEDOWN:
			move_down()
		enemy_states.MOVEUP:
			move_up()
		enemy_states.DEAD:
			dead()
		
	move_and_slide()

func random_generation():
	dir = randi() % 4
	random_direction()

func random_direction():
	match dir:
		0:
			current_states = enemy_states.MOVERIGHT
		1:
			current_states = enemy_states.MOVELEFT
		2:
			current_states = enemy_states.MOVEDOWN
		3:
			current_states = enemy_states.MOVEUP
	

func move_right():
	velocity = Vector2.RIGHT * speed
	$Anim.play("Walk_Right")
	
func move_left():
	velocity = Vector2.LEFT * speed
	$Anim.play("Walk_Left")
	
func move_down():
	velocity = Vector2.DOWN * speed
	$Anim.play("Walk_Right")
	
func move_up():
	velocity = Vector2.UP * speed
	$Anim.play("Walk_Left")

func dead():
	dead_animation()
	queue_free()

func dead_animation():
	var dead = dead_anim.instantiate()
	dead.global_position = global_position
	get_tree().get_root().add_child(dead)
	loot_Souls()
	
func loot_Souls():
	var Souls = Soul_loot.instantiate()
	Souls.global_position = global_position
	get_tree().get_root().add_child(Souls)
