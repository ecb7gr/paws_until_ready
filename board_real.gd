extends Area2D
var in_body = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_pickable = true
	monitoring = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass



func _on_area_entered(area: Area2D) -> void:
	in_body = true
	pass # Replace with function body.




func _on_area_exited(area: Area2D) -> void:
	in_body=false
	pass # Replace with function body.


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		get_tree().change_scene_to_file("res://homeScreen.tscn")
	pass # Replace with function body.
