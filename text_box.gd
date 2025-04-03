extends CanvasLayer
@onready var textbox_container = $TextboxContainer
@onready var con_symbol = $TextboxContainer/MarginContainer/HBoxContainer/Label2
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label

#https://www.youtube.com/watch?v=QEHOiORnXIk&t=136s
var tween #CHATGPT 4 used bc this godot version does not have tween and i had to figure that out
var text_queue = []
signal on_display_finished
enum State{
	READY, READING, FINISHED
}
var current_state = State.READY
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match current_state:
		State.READY:
			if text_queue.is_empty():
				on_display_finished.emit()
			
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
	
