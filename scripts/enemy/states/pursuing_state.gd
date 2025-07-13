extends EnemyState

@export var attacking_state: EnemyState
@export var idle_state: EnemyState


func process_physics(delta: float) -> EnemyState:

	if parent.target_is_in_attack_range:
		return attacking_state
	elif !parent.target_is_in_sight_range:
		return idle_state
	
	var direction = (parent.TARGET.position - parent.position).normalized()
	parent.position += direction * parent.SPEED * delta
	return null
