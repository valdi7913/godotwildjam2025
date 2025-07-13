extends WeaponState

@export var charging_state: WeaponState

func enter():
	parent.is_attacking = false
	
func exit():
	parent.is_attacking = true

func process_input(event: InputEvent) -> WeaponState:
	if Input.is_action_just_pressed("left_click"):
		return charging_state
	else:
		return null
