extends Node2D

@onready var _player_character : CharacterBody2D = get_parent()

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		_player_character.move(Globals.InputDirection.LEFT)
	if Input.is_action_pressed("ui_right"):
		_player_character.move(Globals.InputDirection.RIGHT)
	if Input.is_action_pressed("ui_up"):
		_player_character.move(Globals.InputDirection.UP)
	if Input.is_action_pressed("ui_down"):
		_player_character.move(Globals.InputDirection.DOWN)
