class_name EnemyWeaponController
extends WeaponController

var parent: Enemy

func init(parent: Enemy):
	self.parent = parent

func wants_to_attack() -> bool:
	return parent.target_is_in_attack_range
