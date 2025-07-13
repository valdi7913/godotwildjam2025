extends EnemyState

@export var pursuing_state: EnemyState

func process_physics(_delta: float) -> EnemyState:
	var direction = (parent.TARGET.position - parent.position).normalized()
	parent.weapon_anchor.rotation = direction.angle()
	if !parent.target_is_in_attack_range:
		return pursuing_state
	return null
