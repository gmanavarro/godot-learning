extends StaticBody2D
class_name Bar

@onready var shape = $CollisionShape2D

const VELOCITY = 300

func move(direction: int, delta: float) -> void:
  var viewport_size = get_viewport_rect().size
  var top = 0 + shape.shape.size.y / 2
  var bottom = viewport_size.y - shape.shape.size.y / 2
  position.y = clamp(position.y + direction * VELOCITY * delta, top, bottom)