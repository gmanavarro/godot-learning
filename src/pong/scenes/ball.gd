extends RigidBody2D

const VELOCITY = 450

signal on_goal_reached(args)

func shoot(direction: Vector2) -> void:
  linear_velocity = direction.normalized() * VELOCITY

func _physics_process(delta: float) -> void:
  var collision = move_and_collide(linear_velocity * delta)
  if collision:
    var collider = collision.get_collider()
    var shape = collision.get_collider_shape().name
    
    if collider.name == "Player" or collider.name == "Bot":
      var difference_from_center = collision.get_position().y - collider.get_position().y
      linear_velocity = Vector2(VELOCITY, difference_from_center * 5).normalized() * VELOCITY

    if collider.name == "GoalBoundaries":
      linear_velocity = linear_velocity.bounce(collision.get_normal())
      emit_signal("on_goal_reached", shape)
