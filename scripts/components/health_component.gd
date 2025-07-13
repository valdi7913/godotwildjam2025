class_name HealthComponent
extends Node

signal health_change(diff: float, current_health: float, max_health: float)
signal health_depleted

@export var MAX_HEALTH: float = 100.0

var current_health: float = MAX_HEALTH
		
func change_health(diff: float):
	if diff == 0:
		return
	
	current_health += diff
	health_change.emit(diff, current_health, MAX_HEALTH)
	
	if current_health <= 0:
		health_depleted.emit()
