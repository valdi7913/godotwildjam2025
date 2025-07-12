class_name Player
extends Area2D

@onready var animation_player: AnimatedSprite2D = $Character
@onready var state_machine: PlayerStateMachine = $state_machine

@onready var weapon_anchor: Node2D = $weapon_anchor
@onready var weapon: Weapon = $weapon_anchor/weapon

@export var walking_speed = 200.0
@export var running_speed = 400.0
@export var jump_speed = 400.0

var direction: Vector2 = Vector2(0,0)
var facing_right: bool:
	get: return direction.x < 0

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouse:
		direction = (event.position - position).normalized()
		var mouse_deg = direction.angle()
		print(rad_to_deg(mouse_deg))
		print(weapon_anchor.rotation)
		weapon_anchor.rotation = mouse_deg
		
	#flip weapon sprite based on direction
	var is_going_left: bool = direction.x < 0
	animation_player.flip_h = is_going_left
	weapon.sprite.flip_h = is_going_left
	weapon.sprite.flip_v = is_going_left
	weapon.z_index = 10 if direction.y > 0 else -10
	
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	if not weapon.is_attacking:
		state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
