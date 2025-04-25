extends VideoStreamPlayer
signal enter_pressed5
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
		
		Transition.transition()
		await Transition.on_transition_finished
		enter_pressed5.emit()
