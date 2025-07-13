class_name WeaponState
extends Node

@export var animation_name: String

var parent: Spear
var weapon_controller: WeaponController

func enter() -> void:
	print(animation_name)

func exit() -> void:
	pass

func process_frame(_delta: float) -> WeaponState:
	return null

func process_input(_event: InputEvent) -> WeaponState:
	return null

func process_physics(_delta: float) -> WeaponState:
	return null
