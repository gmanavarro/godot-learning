extends Bar

@onready var ball = get_node("../Ball")

func _physics_process(delta: float) -> void:
  var direction = 0
  if ball.position.y > position.y + shape.shape.size.y / 2:
    direction = 1
  if ball.position.y < position.y - shape.shape.size.y / 2:
    direction = -1
  if direction != 0:
    move(direction, delta)
