extends PlayerState

@export var jumping_state: PlayerState
@export var running_state: PlayerState
@export var walking_state: PlayerState

func process_physics(_delta: float) -> PlayerState:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var is_shift_pressed = Input.is_action_pressed("shift")

	if direction.length() != 0 and is_shift_pressed:
		return running_state
	elif direction.length() != 0:
		return walking_state
	elif Input.is_action_just_pressed("jump"):
		return jumping_state
	else:
		return null
