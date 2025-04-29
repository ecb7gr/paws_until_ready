extends Node2D
@onready var energy = $CharacterBody2D/Camera2D/CanvasLayer
@onready var ghost = $CharacterBody2D
@onready var camera = $CharacterBody2D/Camera2D
@onready var cut_cam = $Camera2D
@onready var anim = $Camera2D/AnimationPlayer
@onready var sad_dog = $Node2D
@onready var coll_for_scene = $CharacterBody2D/CollisionShape2D2
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ghost.set_inactive()
	sad_dog.hide_bub()
	sad_dog.get_child(1).disabled = true
	cut_cam.make_current() #CHATGPT4 helped me find this method
	energy.increment_energy_value()
	energy.increment_energy_value()
	energy.increment_energy_value()
	energy.increment_energy_value()
	energy.increment_energy_value()
	TextBox.queue_text("I'm at a loss.")
	TextBox.queue_text("I always thought I...")
	TextBox.queue_text("I...")
	TextBox.queue_text("...Oh!")
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
	await TextBox.on_display_finished
	camera.make_current()
	ghost.set_active()
	sad_dog.show_bub()
	sad_dog.set_un_relax()
	sad_dog.get_child(1).disabled = false
	sad_dog.close_enough_to_dog.connect(_test)
	await TextBox.on_display_finished
	
	
	pass # Replace with function body.

func _test():
	TextBox.queue_text("Hey, dude,")
	TextBox.queue_text("You alright?")
	TextBox.display_text()
	await TextBox.on_display_finished
	sad_dog.get_child(0).play()
	timer.start()
	await timer.timeout
	ghost.set_inactive()
	TextBox.queue_text("Oh my god,")
	TextBox.queue_text("I think I would die a second time for you.")
	TextBox.display_text()
	await TextBox.on_display_finished
	timer.start()
	await timer.timeout
	sad_dog.get_child(0).stop()
	TextBox.queue_text("That being said...")
	TextBox.queue_text("I genuinely have no idea what you're trying to say")
	TextBox.display_text()
	await TextBox.on_display_finished
	sad_dog.set_not_distressed()
	sad_dog.set_relax()
	timer.start()
	await timer.timeout
	TextBox.queue_text("Thanks, that doesn't help")
	TextBox.display_text()
	await TextBox.on_display_finished
	sad_dog.set_distress()
	sad_dog.set_un_relax()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_collision_shape_2d_2_tree_entered() -> void:
	pass # Replace with function body.


func _on_node_2d_close_enough_to_dog() -> void:
	pass # Replace with function body.
