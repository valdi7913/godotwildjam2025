class_name Spear
extends Weapon

@onready var hurt_box: Area2D = $hurt_box
@onready var state_machine: WeaponStateMachine = $state_machine
@export var weapon_controller: WeaponController

func _ready() -> void:
	state_machine.init(self, weapon_controller)
	hurt_box.set_collision_layer_value(weapon_controller.collission_layer,true)
	hurt_box.set_collision_mask_value(weapon_controller.collission_mask,true)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _on_swing_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		print("player hit")
		var player: Player = area
		player.health_component.change_health(-10.0)
	if area.is_in_group("Enemies"):
		print("Enemy hit!", area)
		var enemy: Enemy = area
		enemy.health_component.change_health(-30.0)
