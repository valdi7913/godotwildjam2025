class_name WeaponState
extends Node

@export var animation_name: String

var parent: Spear

func enter() -> void:
	print(animation_name)

func exit() -> void:
	pass

func process_frame(delta: float) -> WeaponState:
	return null

func process_input(event: InputEvent) -> WeaponState:
	return null

func process_physics(delta: float) -> WeaponState:
	return null
