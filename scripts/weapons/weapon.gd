class_name Weapon
extends Node2D

@export var damage: float
@export var attack_speed: float # attacks per minute

@onready var sprite_anchor: Node2D = $SpriteAnchor
@onready var sprite: AnimatedSprite2D = $SpriteAnchor/Sprite
var is_attacking: bool = false
