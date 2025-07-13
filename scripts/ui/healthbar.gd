extends TextureProgressBar


func _on_player_health_changed(diff: float, current: float, max: float) -> void:
	value = (current/max) * 100
