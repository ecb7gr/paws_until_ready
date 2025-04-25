extends Node2D
signal enter_pressed4
enum TRIGGERED {NO, YES}
var triggered
var textboxtriggered
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	triggered = TRIGGERED.NO
	textboxtriggered = TRIGGERED.NO
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if Input.is_action_just_pressed("ui_text_completion_accept") && triggered == TRIGGERED.NO && is_visible_in_tree():
		triggered = TRIGGERED.YES
		TextBox.queue_text("\"One must have a mind of Winter...\"")
		await TextBox.on_display_finished
		Transition.transition()
		await Transition.on_transition_finished
		enter_pressed4.emit()
	pass
