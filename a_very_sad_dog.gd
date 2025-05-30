extends Area2D
@onready var bub = $AnimatedSprite2D/Sprite2D
@onready var dis = $AnimatedSprite2D/Sprite2D/AnimatedSprite2D
@onready var rel = $AnimatedSprite2D/Sprite2D/Sprite2D
@onready var ball = $AnimatedSprite2D/Sprite2D/Sprite2D2
@onready var ghost = $AnimatedSprite2D/Sprite2D/Sprite2D3
signal close_enough_to_dog
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = true
	
	pass # Replace with function body.
func hide_bub():
	bub.hide()
func show_bub():
	bub.show()
func set_distress():
	dis.show()
func set_not_distressed():
	dis.hide()
func set_relax():
	rel.show()
func set_un_relax():
	rel.hide()
func set_un_ball():
	ball.hide()
func set_ball():
	ball.show()
func set_ghost():
	ghost.show()
func set_un_ghost():
	ghost.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body) -> void:
	print("trigger")
	close_enough_to_dog.emit()
	pass # Replace with function body.
