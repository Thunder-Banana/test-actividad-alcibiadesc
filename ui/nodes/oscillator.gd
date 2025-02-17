class_name Oscillator extends Node2D


@export_category("X Movement")
@export var x_speed: float = 0.0
@export var x_radius: float = 0.0
@export var x_phase: float = 0.0

@export_category("Y Movement")
@export var y_speed: float = 1.0
@export var y_radius: float = 2.0
@export var y_phase: float = 0.0

var initial_pos: Vector2
var time: float = 0.0


func _ready() -> void:
	initial_pos = position


func _process(delta: float) -> void:
	time += delta
	if time > 7: time -= 2 * PI
	position = initial_pos + Vector2(
		sin(time * x_speed + x_phase) * x_radius,
		sin(time * y_speed + y_phase) * y_radius,
	)
