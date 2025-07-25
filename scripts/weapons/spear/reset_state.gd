extends WeaponState

@export var idle_state: WeaponState
@export var LENGTH_IN_SECONDS : float = 0.1

var finished: bool = false

func enter() -> void:
	finished = false
	
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(parent.sprite_anchor, "rotation", deg_to_rad(0), LENGTH_IN_SECONDS)
	tween.tween_property(parent.sprite_anchor, "position", Vector2(4, 0), LENGTH_IN_SECONDS)
	tween.connect("finished", _on_swing_finished)
	
func _on_swing_finished() -> void:
	finished = true
	
func process_frame(_delta: float) -> WeaponState:
	if finished:
		return idle_state
	return null
