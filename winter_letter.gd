extends Node2D
@onready var letter = $letter_text
var can_enter = false
signal enter_pressed
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TextBox.hide()
	letter.display_text("Dear friend,\t
	In case you're wondering, I'm doing well!\nYour mom is still pretty sad, but I think she\n
	likes having me around. Don't worry--I'll make sure she's okay.\n\n
	I've heard about some lonely ghosts\nwhere you are. They're not like you, who\nchooses to stick around. They're stuck,\nunable to find peace.
	While you wait, maybe try and seek some\nout. You can do a lot to help.
	\n\n   With love,\n                Winter
	
	
	
	
	")
	await letter.on_letter_text_completion
	await enter_pressed
	
	TextBox.queue_text("Oh, Winter...")
	TextBox.show()
	TextBox.display_text()
	await TextBox.on_display_finished
	print("booyah fucko")
	#get_tree().change_scene_to_file("res://intro_cut_scene.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_text_completion_accept"):
		enter_pressed.emit()
	pass
