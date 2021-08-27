extends State

# If we get a message asking us to jump, we jump.
func enter(msg := {}) -> void:
	owner.sprite.animation = "Air"
	if msg.has("do_jump"):
		owner.velocity.y = -owner.jump_impulse


func physics_update(delta: float) -> void:
	# Horizontal movement.
	var input_direction_x: float = (
		Input.get_action_strength("move_right")
		- Input.get_action_strength("move_left")
	)
	owner.velocity.x = owner.speed * input_direction_x

	if owner.velocity.x > 0:
		owner.sprite.flip_h = false
	elif owner.velocity.x < 0:
		owner.sprite.flip_h = true


	# Vertical movement.
	owner.velocity.y += owner.gravity * delta
	owner.velocity = owner.move_and_slide(owner.velocity, Vector2.UP)

	# Landing.
	if owner.is_on_floor():
		if is_equal_approx(owner.velocity.x, 0.0):
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Walk")
