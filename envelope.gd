extends Area2D
var processing = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_pickable = true
	monitoring = true
	set_process_input(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		Transition.transition()
		await Transition.on_transition_finished
		get_tree().change_scene_to_file("res://intro_cut_scene.tscn")
	pass # Replace with function body.
 # Replace with function body.
