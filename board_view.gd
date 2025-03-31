extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TextBox.show()
	TextBox.queue_text("A letter? Is this for me?")
	TextBox.display_text()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
