extends WeaponState

@export var reseting_state: WeaponState
@export var LENGTH_IN_SECONDS : float = 0.1

var finished = false

func enter() -> void:
	finished = false
	
	parent.hurt_box.monitoring = true
	
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(parent.sprite_anchor, "position", Vector2(0,0), LENGTH_IN_SECONDS)
	tween.tween_property(parent.sprite_anchor, "rotation", deg_to_rad(-40), LENGTH_IN_SECONDS)
	tween.connect("finished", _on_swing_finished)
	
func _on_swing_finished():
	parent.hurt_box.monitoring = false
	finished = true
	
func process_frame(_delta: float) -> WeaponState:
	if finished:
		return reseting_state
	return null
