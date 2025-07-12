extends WeaponState

@export var swing_state: WeaponState

func enter():
	parent.is_attacking = false
	
func exit():
	parent.is_attacking = true

func process_input(event: InputEvent) -> WeaponState:
	if Input.is_action_just_pressed("left_click"):
		return swing_state
	else:
		return null
