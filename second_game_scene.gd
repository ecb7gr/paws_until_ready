extends Node2D
@onready var ghost = $CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TextBox.hide()
	TextBox.queue_text("What a good dog.")
	TextBox.queue_text("But...there are other ghosts here?")
	TextBox.queue_text("So far, it's seemed to just be me.")
	TextBox.queue_text("Where do I find them?")
	TextBox.show()
	load_textbox()
	await TextBox.on_display_finished
	ghost.set_inactive()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func load_textbox():
	ghost.set_inactive()
	TextBox.show_textbox()
	TextBox.display_text()
	await TextBox.on_display_finished
	ghost.set_active()
