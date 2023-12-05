extends Character

@onready var sword: Node2D= get_node("Sword")
@onready var sword_anim_player: AnimationPlayer = sword.get_node("SwordAnimationPlayer") 

func _process(_delta: float) -> void:
	var mous_dir = Vector2(get_global_mouse_position() - global_position).normalized()
	
	if mous_dir.x > 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif mous_dir.x < 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
	
	sword.rotation = mous_dir.angle()
	if sword.scale.y == 1 and mous_dir.x < 0:
		sword.scale.y = -1
	if sword.scale.y == -1 and mous_dir.x > 0:
		sword.scale.y = 1
	
	if Input.is_action_just_pressed("ui_attack") and not sword_anim_player.is_playing() and not isJumping:
		isAttacking = true
		sword_anim_player.play("attack")
		await sword_anim_player.animation_finished
		isAttacking = false
	

func get_input() -> void:
	mov_dir = Vector2.ZERO
	mov_dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	mov_dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")


