class_name EnemyWeaponController
extends WeaponController

var parent: Enemy

func init(init_parent: Enemy):
	self.parent = init_parent

func wants_to_attack() -> bool:
	return parent.target_is_in_attack_range
