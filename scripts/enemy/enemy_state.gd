class_name EnemyState
extends Node

@export var animation_name: String

var parent: Enemy

func enter() -> void:
	print(animation_name)

func exit() -> void:
	pass

func process_frame(delta: float) -> EnemyState:
	return null

func process_input(event: InputEvent) -> EnemyState:
	return null

func process_physics(delta: float) -> EnemyState:
	return null
