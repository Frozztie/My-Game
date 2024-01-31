extends CharacterBody2D

@onready var anim_tree = $Anim_Tree
@onready var anim_state = anim_tree.get("parameters/playback")
@onready var anim = $Anim


enum player_states {MOVE, RUN, ATTACK1, ATTACK2, ATTACK3}
var current_states = player_states.MOVE

var input_movement = Vector2.ZERO
var speed = 150

func _ready():
	$HitBox/CollisionShape2D.disabled = true
	anim.play("RESET")

func _physics_process(_delta):
	match current_states:
		player_states.MOVE:
			move()
		player_states.RUN:
			run()
		player_states.ATTACK1:
			attack1()
		player_states.ATTACK2:
			attack2()
		player_states.ATTACK3:
			attack3()

func move():
	input_movement = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_movement != Vector2.ZERO:
		anim_tree.set("parameters/Idle/blend_position", input_movement)
		anim_tree.set("parameters/Walk/blend_position", input_movement)
		anim_tree.set("parameters/Run/blend_position", input_movement)
		anim_tree.set("parameters/Sword_1/blend_position", input_movement)
		anim_tree.set("parameters/Sword_2/blend_position", input_movement)
		anim_tree.set("parameters/Dagger/blend_position", input_movement)
		#anim_tree.set("parameters/Jump/blend_position", input_movement)
		anim_state.travel("Walk")

	if input_movement == Vector2.ZERO:
		anim_state.travel("Idle")
		velocity = Vector2.ZERO

	if Input.is_action_just_pressed("attack"):
		current_states = player_states.ATTACK1

	if Input.is_action_just_pressed("run"):
		current_states = player_states.RUN

func run():
	anim_state.travel("Run")

func attack1():
	anim_state.travel("Sword_1")
	current_states = player_states.ATTACK2
	
func attack2():
	anim_state.travel("Sword_2")
	current_states = player_states.ATTACK3
	
func attack3():
	anim.play("sword3Whirl")
	current_states = player_states.MOVE
	

func _process(_delta):
	velocity = input_movement * speed
	move_and_slide()

func on_states_reset():
	current_states = player_states.MOVE

func on_attack_next1():
	current_states = player_states.ATTACK2

func on_attack_next2():
	current_states = player_states.ATTACK3
