extends EnemyState

@export var pursuing_state: EnemyState

func process_physics(delta: float) -> EnemyState:
	var direction = (parent.TARGET.position - parent.position).normalized()
	parent.attack(direction)
	if !parent.target_is_in_attack_range:
		return pursuing_state
	return null
