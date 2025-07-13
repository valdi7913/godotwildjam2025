class_name Enemy
extends Area2D

@onready var sprite: AnimatedSprite2D = $sprite
@onready var ai_state_machine: EnemyStateMachine = $ai_state_machine
@onready var weapon_controller: Node = $weapon_controller
@onready var weapon_anchor: Node2D = $weapon_anchor
@onready var health_component: HealthComponent = $health_component

@export var TARGET: Area2D
@export var SPEED: float = 100.0

@onready var attack_area: Area2D = $AttackArea
@onready var sight_area: Area2D = $SightArea

var target_is_in_attack_range: bool = false
var target_is_in_sight_range: bool = false
var weapon_is_attacking = false

func _ready() -> void:
	ai_state_machine.init(self, TARGET)
	weapon_controller.init(self)

func _physics_process(delta: float) -> void:
	ai_state_machine.process_physics(delta)

func _process(delta: float) -> void:
	ai_state_machine.process_frame(delta)

func _on_attack_area_entered(area: Area2D) -> void:
	if area == TARGET:
		target_is_in_attack_range = true

func _on_attack_area_exited(area: Area2D) -> void:
	if area == TARGET:
		target_is_in_attack_range = false

func _on_sight_area_entered(area: Area2D) -> void:
	if area == TARGET:
		target_is_in_sight_range = true

func _on_sight_area_exited(area: Area2D) -> void:
	if area == TARGET:
		target_is_in_sight_range = false
		
func _on_health_depleted() -> void:
	queue_free()
