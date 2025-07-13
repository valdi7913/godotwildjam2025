class_name EnemyState
extends Node

@export var animation_name: String

var parent: Enemy
var target: Area2D

func enter() -> void:
	print("Enemy", animation_name)
	parent.sprite.play(animation_name)

func exit() -> void:
	pass

func process_frame(_delta: float) -> EnemyState:
	return null

func process_input(_event: InputEvent) -> EnemyState:
	return null

func process_physics(_delta: float) -> EnemyState:
	return null
