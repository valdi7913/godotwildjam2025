extends PlayerState

@export var idle_state: PlayerState
@export var running_state: PlayerState
@export var walking_state: PlayerState

func process_physics(delta) -> PlayerState:
	# Maybe turn this into a rolling state
	return idle_state
