extends WeaponState

@export var reset_state: WeaponState
@export var charge_state: WeaponState
@export var LENGTH_IN_SECONDS : float = 0.2

var player_clicked = false
var finished = false

func enter() -> void:
	finished = false
	player_clicked = false
	
	parent.swing_area.monitoring = true
	
	var rotation_tween = create_tween()
	rotation_tween.set_ease(Tween.EASE_IN_OUT)
	rotation_tween.tween_property(parent.sprite_anchor, "rotation", deg_to_rad(180), LENGTH_IN_SECONDS)
	rotation_tween.tween_property(parent.sprite_anchor, "rotation", deg_to_rad(180), LENGTH_IN_SECONDS).set_delay(0.4)
	rotation_tween.connect("finished", _on_swing_finished)
	
func _on_swing_finished():
	parent.swing_area.monitoring = false
	finished = true
	
func _unhandled_input(_event: InputEvent) -> void:
	if weapon_controller.wants_to_attack() and not player_clicked:
		player_clicked = true
		
func process_frame(_delta: float) -> WeaponState:
	if finished:
		if player_clicked:
			return charge_state
		else:
			return reset_state
	return null
