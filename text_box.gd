extends CanvasLayer
@onready var textbox_container = $TextboxContainer
@onready var con_symbol = $TextboxContainer/MarginContainer/HBoxContainer/Label2
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label
var tween
var text_queue = []

enum State{
	READY, READING, FINISHED
}
var current_state = State.READY
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	queue_text("hello")
	queue_text("goodbye")
	display_text()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match current_state:
		State.READY:
			if !text_queue.is_empty():
				display_text()
		State.READING:
			if Input.is_action_just_pressed("ui_text_completion_accept"):
				label.visible_characters = len(label.text)
				tween.kill()
				_on_tween_done()
			pass
		State.FINISHED:
			if Input.is_action_just_pressed("ui_text_completion_accept"):
				change_state(State.READY)
				hide_textbox()
	pass
func queue_text(next_text):
	text_queue.push_back(next_text)
	pass
func hide_textbox():
	con_symbol.text = ""
	label.text = ""
	textbox_container.hide()
	pass
func show_textbox():
	con_symbol.text = ""
	textbox_container.show()
	
	
func display_text():
	label.text = text_queue.pop_front()
	change_state(State.READING)
	show_textbox()
	label.visible_characters = 0  # Start hidden
	tween = create_tween()
	tween.tween_property(label, "visible_characters", len(label.text), len(label.text) * 0.05)
	tween.finished.connect(_on_tween_done)
	
func _on_tween_done():
	con_symbol.text = "v"
	change_state(State.FINISHED)
	
func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to ready")
		State.READING:
			print("Changing state to reading")
		State.FINISHED:
			print("Changing state to finished")
	pass
