extends EnemyState

@export var pursuing_state: EnemyState

func process_physics(_delta: float) -> EnemyState:
	if parent.target_is_in_sight_range:
		return pursuing_state
		
	return null
