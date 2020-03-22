extends Node2D
var screen_size
var pad_size
const PAD_SPEED = 250
var ball_speed = 80
var direction = Vector2(-1,0)
var flag = 0
func _ready() -> void:
	screen_size = get_viewport_rect().size
	set_process(true)
	
	
func _process(delta):
	var ball_pos = get_node("Ball").position
	var Player1_pos = get_node("Player1").position
	var Player2_pos = get_node("Player2").position
	ball_pos += direction * ball_speed * delta
	get_node("Ball").position = ball_pos
	var collisions = get_node("Ball").get_colliding_bodies()
	
	if ball_pos.x < 0 or ball_pos.x > screen_size.x:
		ball_pos = screen_size * 0.5
		direction = Vector2(-1, 0)
		ball_speed = 80
		flag = 1
		get_node("Ball").position = ball_pos
		
	if Player2_pos.y > 57 and Input.is_action_pressed("Player2_up"):
		Player2_pos.y += -PAD_SPEED * delta
		get_node("Player2").position = Player2_pos
	if Player2_pos.y < screen_size.y - 57 and Input.is_action_pressed("Player2_down"):
		Player2_pos.y += PAD_SPEED * delta
		get_node("Player2").position = Player2_pos
	
	if Player1_pos.y > 57 and Input.is_action_pressed("Player1_up"):
		Player1_pos.y += -PAD_SPEED * delta
		get_node("Player1").position = Player1_pos
	if Player1_pos.y < screen_size.y - 57 and Input.is_action_pressed("Player1_down"):
		Player1_pos.y += PAD_SPEED * delta
		get_node("Player1").position = Player1_pos
	