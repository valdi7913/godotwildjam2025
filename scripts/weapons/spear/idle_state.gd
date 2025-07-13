extends WeaponState

@export var charging_state: WeaponState

func enter():
	parent.is_attacking = false
	
func exit():
	parent.is_attacking = true

func process_frame(_delta: float) -> WeaponState:
	if weapon_controller.wants_to_attack():
		return charging_state
	else:
		return null
