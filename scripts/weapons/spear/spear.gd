class_name Spear
extends Weapon

@onready var swing_area: Area2D = $SwingArea
@onready var state_machine: WeaponStateMachine = $state_machine
@export var weapon_controller: WeaponController

func _ready() -> void:
	state_machine.init(self, weapon_controller)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)
