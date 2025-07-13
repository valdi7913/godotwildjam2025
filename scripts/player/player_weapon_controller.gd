extends WeaponController

func wants_to_attack() -> bool:
	return Input.is_action_just_pressed("left_click")
