extends CharacterBody2D 
class_name Player

@onready var anim_tree = $Anim_Tree
@onready var anim_state = anim_tree.get("parameters/playback")
@onready var anim = $Anim


enum player_states {MOVE, RUN, ATTACK1, ATTACK2, ATTACK3, DEAD}
var current_states = player_states.MOVE

var input_movement = Vector2.ZERO
var speed = 150
var health = player_data.health

func _ready():
	$HurtBox/Sword.disabled = true
	$HurtBox/Dagger.disabled = true
	$HurtBox/Whirl.disabled = true
	$HurtBox/AOE.disabled = true
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
		player_states.DEAD:
			dead()

func move():
	input_movement = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	
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
#
	if Input.is_action_just_pressed("attack"):
		current_states = player_states.ATTACK1

	if Input.is_action_just_pressed("run"):
		current_states = player_states.RUN
	
	if player_data.health <= 0:
		current_states = player_states.DEAD

func run():
	anim_state.travel("Run")
	if Input.is_action_just_released("run"):
		current_states = player_states.MOVE

func attack1():
	anim_state.travel("Sword_1")
	current_states = player_states.ATTACK1
	await anim.animation_finished
	
func attack2():
	if Input.is_action_just_pressed("attack"):
		anim_state.travel("Sword_2")
		current_states = player_states.ATTACK2
		await anim.animation_finished
	else:
		current_states = player_states.MOVE
	
func attack3():
	if Input.is_action_just_pressed("attack"):
		anim.play("sword3Whirl")
		current_states = player_states.MOVE
		await anim.animation_finished
	else:
		current_states = player_states.MOVE

func dead():
	anim_state.travel("Dead")
	await get_tree().create_timer(1).timeout
	player_data.health = 4
	get_tree().reload_current_scene()

func _process(_delta):
	velocity = input_movement * speed
	move_and_slide()

func on_states_reset():
	current_states = player_states.MOVE

func on_attack_next1():
	current_states = player_states.ATTACK2

func on_attack_next2():
	current_states = player_states.ATTACK3
