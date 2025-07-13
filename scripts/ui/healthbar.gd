extends TextureProgressBar

func _on_player_health_changed(_diff: float, current_health: float, max_health: float) -> void:
	value = (current_health/max_health) * 100
