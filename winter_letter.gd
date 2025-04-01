extends Node2D
@onready var letter = $letter_text
var can_enter = false
signal enter_pressed
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TextBox.hide()
	letter.display_text("Dear friend,\t
	In case you're wondering, I'm doing okay!\tYour mom is still pretty sad, but I'm\ntaking care of her.
	 I remind her of you. She likes that, I\nbelieve.\n\nWhile you wait, they said you could still help out the people and animals where you are.\n
	I think there are some really lonely spirits. You can do a lot to help them.\n\n\n   With love,\n                Winter
	
	
	
	
	")
	await letter.on_letter_text_completion
	await enter_pressed
	
	TextBox.queue_text("Oh, Winter...")
	TextBox.show()
	TextBox.display_text()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_text_completion_accept"):
		enter_pressed.emit()
	pass
