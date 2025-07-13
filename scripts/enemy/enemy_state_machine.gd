class_name EnemyStateMachine
extends Node

@export var starting_state: EnemyState

var current_state: EnemyState
var target: Area2D

func init(parent: Enemy, target: Area2D) -> void:
	for child in get_children():
		if child is EnemyState:
			child.parent = parent

	change_state(starting_state)

func change_state(new_state: EnemyState) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)

func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)
