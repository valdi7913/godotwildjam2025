extends EnemyState

@export var pursuing_state: EnemyState

func process_physics(delta: float) -> EnemyState:
	var direction = parent.TARGET.position - parent.position
	var distance = direction.length()
	if parent.target_is_in_sight_range:
		return pursuing_state
		
	return null
