extends Node2D
@onready var ghost = $ghost
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TextBox.hide()
	TextBox.queue_text("So...I'm really dead?")
	TextBox.queue_text("What's going on?")
	TextBox.queue_text("What is this place?")
	TextBox.show()
	load_textbox()
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
