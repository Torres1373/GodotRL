extends FiniteStateMachine

#TODO JUMP

func _init() -> void:
	_add_state("idle")
	_add_state("move")
	_add_state("jump")

func _ready() -> void:
	set_state(states.idle)

func _state_logic(_delta: float) -> void:
	parent.get_input()
	parent.move()

func _get_transition() -> int:
	match state:
		states.idle:
			if parent.velocity.length() > 10:
				return states.move
			#if Input.is_action_pressed("ui_jump") and parent.is_on_floor():
				#return states.jump
		states.move:
			if parent.velocity.length() < 10:
				return states.idle
			#if Input.is_action_pressed("ui_jump") and parent.is_on_floor():
				#return states.jump
		#states.jump:
			#if parent.velocity.length() < 10 and parent.is_on_floor():
				#return states.idle
			#elif parent.velocity.length() > 10 and parent.is_on_floor():
				#return states.move
	return -1

func _enter_state(_previous_state: int, _new_state: int) -> void:
	match _new_state:
		states.idle:
			animation_player.play("idle")
		states.move:
			animation_player.play("move")
		states.jump:
			animation_player.play("jump")
