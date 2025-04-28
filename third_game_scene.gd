extends Node2D
@onready var energy = $CharacterBody2D/Camera2D/CanvasLayer
@onready var ghost = $CharacterBody2D
@onready var camera = $CharacterBody2D/Camera2D
@onready var cut_cam = $Camera2D
@onready var anim = $Camera2D/AnimationPlayer
@onready var sad_dog = $Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ghost.set_inactive()
	sad_dog.hide_bub()
	cut_cam.make_current() #CHATGPT4 helped me find this method
	energy.increment_energy_value()
	energy.increment_energy_value()
	energy.increment_energy_value()
	energy.increment_energy_value()
	energy.increment_energy_value()
	TextBox.queue_text("There it is!")
	TextBox.show()
	TextBox.display_text()
	await TextBox.on_display_finished
	anim.play("new_animation")
	await anim.animation_finished
	TextBox.queue_text("But...")
	TextBox.queue_text("Uh,")
	TextBox.queue_text("It's a dog?")
	TextBox.queue_text("Well, I guess I better go say hi.")
	TextBox.show()
	TextBox.display_text()
	camera.make_current()
	ghost.set_active()
	sad_dog.show_bub()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
