extends CanvasLayer
@onready var label = $RichTextLabel
var tween
@onready var timer = $Timer
signal on_player_text_completion
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.hide()
	pass # Replace with function body.
func display_text(next_text):
	label.text = next_text
	label.show()
	label.visible_characters = 0  # Start hidden
	tween = create_tween()
	tween.tween_property(label, "visible_characters", len(label.text), len(label.text) * 0.02)
	tween.finished.connect(_on_tween_done)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_tween_done():
	timer.start()
func _on_timer_timeout():
	label.hide()
	on_player_text_completion.emit()
	pass # Replace with function body.
