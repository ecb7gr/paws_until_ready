extends Area2D
signal clicked_ball4
enum CLICKED {YES, NO}
var click
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	click = CLICKED.NO
	input_pickable = true
	monitoring = true
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed && click == CLICKED.NO):
		print("click")
		click = CLICKED.YES
		clicked_ball4.emit()
