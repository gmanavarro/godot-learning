extends Node

@onready var ball = $Ball
@onready var player = $Player
@onready var bot = $Bot
@onready var player_score = $PlayerScore
@onready var bot_score = $BotScore

@onready var playerPosition = player.position
@onready var botPosition = bot.position
@onready var ballPositon = ball.position

func _ready() -> void:
	ball.on_goal_reached.connect(score_point)

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot_ball"):
		var x_direction = 1 if randf() > 0.5 else - 1
		var y_direction = randf() * 0.3
		var direction = Vector2(x_direction, y_direction)
		ball.shoot(direction)
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()

func _restart() -> void:
	player.position = playerPosition
	bot.position = botPosition
	ball.position = ballPositon
	ball.linear_velocity = Vector2.ZERO

func score_point(side: String) -> void:
	if side == "Left":
		bot_score.text = str(int(bot_score.text) + 1)
	else:
		player_score.text = str(int(player_score.text) + 1)
	
	_restart()