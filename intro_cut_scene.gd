extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TextBox.queue_text("Oh? Is that you?")
	TextBox.queue_text("You probably don't know\nwhat's going on.")
	TextBox.queue_text("Try not to be scared. I put in\na good word for you.")
	TextBox.queue_text("You've been the best friend I\ncould ever ask for.")
	TextBox.queue_text("I told them that you were kind.")
	TextBox.queue_text("That you held more love and\ncompassion than anyone.")
	TextBox.show_textbox()
	TextBox.display_text()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
