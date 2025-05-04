extends CanvasLayer
@onready var energy = $RichTextLabel2
var energy_value = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	energy.text = str(energy_value) + "/5"
	pass
func increment_energy_value():
	energy_value = energy_value+1
func decrement_energy_value():
	energy_value = energy_value-1
func reset_energy_value():
	energy_value = 0
