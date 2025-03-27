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
	TextBox.queue_text("Goodbye, I can't wait to see\nyou again someday.")
	TextBox.show_textbox()
	TextBox.display_text()
	await TextBox.on_display_finished
	Transition.transition()
	await Transition.on_transition_finished
	var winter = $AnimatedSprite2D
	winter.visible = false
	PlayerText.display_text("What? Winter, no! I'm not going without you!")
	await PlayerText.on_player_text_completion
	Transition.transition()
	await Transition.on_transition_finished
	winter.visible = true
	TextBox.queue_text("Really?")
	TextBox.queue_text("You want to wait for me?")
	TextBox.queue_text("Let me talk to them.")
	TextBox.queue_text("Maybe they can find something else for you.")
	TextBox.show_textbox()
	TextBox.display_text()
	await TextBox.on_display_finished
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://gameStart.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
