extends Node2D
@onready var timer = $Timer
@onready var rect = $ColorRect
@onready var lamb = $Sprite2D
signal post_chop
enum Running {
	PROCESSING, READY
}
var cur_run
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cur_run = Running.READY
	TextBox.queue_text("lambchop? I used to get that toy for Winter....")
	TextBox.show()
	TextBox.display_text()
	await TextBox.on_display_finished
	#Transition.transition()
	#await Transition.on_transition_finished
	
	#get_tree().change_scene_to_file("res://test_game_scene.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (cur_run == Running.READY && rect.is_visible_in_tree()):
		cur_run = Running.PROCESSING
		TextBox.queue_text("lambchop? I used to get that toy for Winter....")
		TextBox.show()
		TextBox.display_text()
		await TextBox.on_display_finished
		Transition.transition()
		await Transition.on_transition_finished
		lamb.hide()
		rect.hide()
		post_chop.emit()
	pass
