extends Bar

func _process_input() -> int:
	var direction = 0
	if Input.is_action_pressed("move_up"):
		direction += - 1
	if Input.is_action_pressed("move_down"):
		direction += 1
	return direction

func _physics_process(delta: float) -> void:
	var direction = _process_input()
	if direction != 0:
		move(direction, delta)
