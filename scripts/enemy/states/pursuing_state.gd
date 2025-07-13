extends EnemyState

@export var attacking_state: EnemyState
@export var idle_state: EnemyState


func process_physics(delta: float) -> EnemyState:
	var direction = (target.position - parent.position).normalized()
	
	parent.weapon_anchor.rotation = direction.angle()
	
	parent.position += direction * parent.SPEED * delta
	
	parent.sprite.flip_h = direction.x < 0
	if direction.y < -0.5:
		parent.sprite.play(animation_name+"_Back")
	else:
		parent.sprite.play(animation_name)
	

	if parent.target_is_in_attack_range:
		return attacking_state
	elif !parent.target_is_in_sight_range:
		return idle_state
	
	return null
