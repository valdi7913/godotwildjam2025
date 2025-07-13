extends EnemyState

@export var pursuing_state: EnemyState

func process_physics(_delta: float) -> EnemyState:
	var direction = (target.position - parent.position).normalized()
	parent.weapon_anchor.rotation = direction.angle()
	
	parent.sprite.flip_h = direction.x < 0
	if direction.y < -0.5:
		parent.sprite.play(animation_name+"_Back")
	else:
		parent.sprite.play(animation_name)
	
	if !parent.target_is_in_attack_range:
		return pursuing_state
	return null
