extends Node2D
@onready var energy = $CharacterBody2D/Camera2D/CanvasLayer
@onready var ghost = $CharacterBody2D
@onready var camera = $CharacterBody2D/Camera2D
@onready var cut_cam = $Camera2D
@onready var anim = $Camera2D/AnimationPlayer
@onready var sad_dog = $Node2D
@onready var coll_for_scene = $CharacterBody2D/CollisionShape2D2
@onready var timer = $Timer
@onready var want_play = $CharacterBody2D/Camera2D/Button
@onready var want_rest = $CharacterBody2D/Camera2D/Button2
@onready var dog_anim = $Node2D/AnimationPlayer
@onready var leaf_rest = $CharacterBody2D/Camera2D/Node2D
@onready var mind_button1 = $CharacterBody2D/Camera2D/Button3
@onready var bird_leaf_mem = $CharacterBody2D/Node2D
@onready var ball = $RigidBody2D
@onready var make_play = $CharacterBody2D/Camera2D/Button4
@onready var ghost_butt = $CharacterBody2D/Camera2D/Button5
@onready var sad_mem = $CharacterBody2D/Node2D2
@onready var leave_butt = $CharacterBody2D/Camera2D/Button6
signal proceed_past_bird
signal proceed_past_rest
signal play_press
signal butt
signal proceed_past_sad
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	leave_butt.hide()
	sad_mem.hide()
	ghost_butt.hide()
	ball.hide()
	sad_dog.set_un_ghost()
	make_play.hide()
	bird_leaf_mem.hide()
	mind_button1.hide()
	leaf_rest.hide()
	want_play.hide()
	want_rest.hide()
	ghost.set_inactive()
	sad_dog.hide_bub()
	sad_dog.set_un_ball()
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
	TextBox.queue_text("You are so cute")
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
	timer.start()
	await timer.timeout
	TextBox.queue_text("Do you want to...")
	TextBox.display_text()
	await TextBox.on_display_finished
	want_play.show()
	want_rest.show()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_text_completion_accept") && leaf_rest.is_visible_in_tree():
		proceed_past_rest.emit()
	if Input.is_action_just_pressed("ui_text_completion_accept") && bird_leaf_mem.is_visible_in_tree():
		proceed_past_bird.emit()
	if Input.is_action_just_pressed("ui_text_completion_accept") && sad_mem.is_visible_in_tree():
		proceed_past_sad.emit()
		sad_mem.hide()	
		ghost_butt.hide()
	pass


func _on_collision_shape_2d_2_tree_entered() -> void:
	pass # Replace with function body.


func _on_node_2d_close_enough_to_dog() -> void:
	pass # Replace with function body.


func _on_play_button_pressed() -> void:
	want_play.hide()
	want_rest.hide()
	timer.start()
	await timer.timeout
	TextBox.queue_text("I bet you've been pretty lonely all this time.")
	TextBox.queue_text("Would you feel better after a bit of play?")
	TextBox.display_text()
	await TextBox.on_display_finished
	dog_anim.play("new_animation")
	await dog_anim.animation_finished
	TextBox.queue_text("Oh, goodness! I guess that's not what you meant. I'm so sorry.")
	TextBox.display_text()
	await TextBox.on_display_finished
	TextBox.queue_text("Maybe we can just rest for a little while instead.")
	TextBox.display_text()
	await TextBox.on_display_finished
	sad_dog.set_not_distressed()
	sad_dog.set_relax()
	_rest()
	pass # Replace with function body.


func _on_rest_button_pressed() -> void:
	want_play.hide()
	want_rest.hide()
	#energy.decrement_energy_value()
	timer.start()
	await timer.timeout
	TextBox.queue_text("I bet you're pretty tired.")
	TextBox.queue_text("Would you feel better after a bit of rest?")
	TextBox.display_text()
	await TextBox.on_display_finished
	sad_dog.set_not_distressed()
	sad_dog.set_relax()
	dog_anim.play("new_animation_2")
	await dog_anim.animation_finished
	_rest()
	pass # Replace with function body.

func _rest():
	TextBox.queue_text("Maybe I can just reach out like before...")
	TextBox.queue_text("Find what you see as restful....")
	TextBox.queue_text("Let me just....Aha!")
	TextBox.display_text()
	await TextBox.on_display_finished
	energy.hide()
	leaf_rest.show()
	sad_dog.hide()
	await proceed_past_rest	
	TextBox.queue_text("Fascinating!")
	TextBox.queue_text("Is this what you wanted?")
	TextBox.display_text()
	await TextBox.on_display_finished
	energy.show()
	leaf_rest.hide()
	sad_dog.hide_bub()
	sad_dog.show()
	energy.decrement_energy_value()
	timer.start()
	await timer.timeout
	TextBox.queue_text("Incredible, I'd love to hear more.")
	TextBox.display_text()
	await TextBox.on_display_finished
	dog_anim.play("new_animation_2")
	await dog_anim.animation_finished
	mind_button1.show()
	pass


func _on_mind_button_1_pressed() -> void:
	print("mind button pressed")
	energy.hide()
	energy.decrement_energy_value()
	mind_button1.hide()
	bird_leaf_mem.show()
	sad_dog.hide()
	await proceed_past_bird
	bird_leaf_mem.hide()
	sad_dog.show()
	timer.start()
	energy.show()
	await timer.timeout
	sad_dog.show_bub()
	sad_dog.set_ball()
	sad_dog.set_un_relax()
	timer.start()
	await timer.timeout
	TextBox.queue_text("Okay so NOW you want to play?")
	TextBox.display_text()
	await TextBox.on_display_finished
	sad_dog.get_child(0).play()
	timer.start()
	await timer.timeout
	sad_dog.get_child(0).stop()
	#ball.set_position(Vector2(790, 350))
	make_play.show()
	await play_press
	ball.show()
	energy.decrement_energy_value()
	TextBox.queue_text("...")
	TextBox.queue_text("I'm going to have to stop trying to understand this.")
	TextBox.display_text()
	await TextBox.on_display_finished
	dog_anim.play("new_animation_2")
	await dog_anim.animation_finished
	sad_dog.get_child(0).play()
	timer.start()
	await timer.timeout
	sad_dog.get_child(0).stop()
	TextBox.queue_text("While you're here,")
	TextBox.queue_text("May I ask...")
	TextBox.queue_text("What do you want?")
	TextBox.display_text()
	await TextBox.on_display_finished
	sad_dog.set_un_ball()
	sad_dog.hide_bub()
	dog_anim.play("new_animation_2")
	await dog_anim.animation_finished
	ghost_butt.show()
	energy.decrement_energy_value()
	await proceed_past_sad
	sad_mem.hide()
	sad_dog.show()
	energy.show()
	TextBox.queue_text("You want a friend...")
	TextBox.queue_text("I don't have much energy left")
	TextBox.queue_text("I'm not sure if I can keep you here")
	TextBox.display_text()
	await TextBox.on_display_finished
	sad_dog.show_bub()
	sad_dog.set_distress()
	timer.start()
	await timer.timeout
	timer.start()
	await timer.timeout
	sad_dog.hide_bub()
	dog_anim.play("new_animation_2")
	await dog_anim.animation_finished
	TextBox.queue_text("Wait! What if I found another friend for you?")
	TextBox.queue_text("If I brought you here,")
	TextBox.queue_text("I think I could send you to another ghost, too!")
	TextBox.display_text()
	await TextBox.on_display_finished
	dog_anim.play("new_animation_2")
	await dog_anim.animation_finished
	TextBox.queue_text("Are you okay with that idea?")
	TextBox.display_text()
	await TextBox.on_display_finished
	sad_dog.get_child(0).play()
	timer.start()
	await timer.timeout
	sad_dog.get_child(0).stop()
	TextBox.queue_text("Okay, let's figure out what kind of ghost we're looking for")
	TextBox.display_text()
	await TextBox.on_display_finished
	leave_butt.show()
	
	
	pass # Replace with function body.


func _on_button_4_pressed() -> void:
	play_press.emit()
	make_play.hide()
	pass # Replace with function body.


func _on_button_5_pressed() -> void:
	sad_dog.hide()
	ball.hide()
	energy.hide()
	sad_mem.show()
	pass # Replace with function body.


func _on_button_6_pressed() -> void:
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://final.tscn")
	pass # Replace with function body.
