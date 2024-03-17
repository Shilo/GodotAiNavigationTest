extends CharacterBody2D

@export var speed: int = 300

func _physics_process(delta: float) -> void:
	# TODO
	move_and_slide()
