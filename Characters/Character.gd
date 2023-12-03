extends CharacterBody2D
class_name Character

const FRICTION: float = 0.15

@export var accel: int = 40
@export var maxVel: int = 100

var mov_dir: Vector2 = Vector2.ZERO

func _physics_process(_delta_: float) -> void:
	move_and_slide()
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)
	
func move() -> void:
	mov_dir= mov_dir.normalized()
	velocity += mov_dir*accel
