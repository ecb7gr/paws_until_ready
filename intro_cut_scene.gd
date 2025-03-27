extends Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TextBox.queue_text("Oh? Is that you?")
	TextBox.queue_text("You probably don't know\nwhat's going on.")
	TextBox.queue_text("Try not to be scared. I put in\na good word for you.")
	TextBox.queue_text("I told them that you are kind.")
	TextBox.queue_text("That you have more love and\ncompassion than anyone.")
	TextBox.queue_text("They said you'd be happy\nwhere you're going.")
	TextBox.queue_text("Friend, I've loved every minute of our time together.")
	TextBox.queue_text("Honestly, I wish I could stay\nby your side.")
	TextBox.queue_text("But I can't wait to see you again\nsomeday.")
	TextBox.show_textbox()
	TextBox.display_text()
	await TextBox.on_display_finished
	Transition.transition()
	await Transition.on_transition_finished
	var winter = $AnimatedSprite2D
	winter.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
