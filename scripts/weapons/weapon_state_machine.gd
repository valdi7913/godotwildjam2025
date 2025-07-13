class_name WeaponStateMachine
extends Node

@export var starting_state: WeaponState

var current_state: WeaponState

func init(parent: Spear, weapon_controller: WeaponController) -> void:
	for child in get_children():
		if child is WeaponState:
			child.parent = parent
			child.weapon_controller = weapon_controller

	change_state(starting_state)

func change_state(new_state: WeaponState) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)
