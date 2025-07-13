class_name WeaponController
extends Node

@export var collission_layer: int = 1
@export var collission_mask: int = 2

func wants_to_attack() -> bool:
	return false
