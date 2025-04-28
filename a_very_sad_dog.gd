extends Node2D
@onready var bub = $AnimatedSprite2D/Sprite2D
@onready var dis = $AnimatedSprite2D/Sprite2D/AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.
func hide_bub():
	bub.hide()
func show_bub():
	bub.show()
func set_distress():
	dis.show()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
