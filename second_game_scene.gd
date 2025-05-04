extends Node2D
@onready var ghost = $CharacterBody2D
@onready var mem = $little_moving_thing
@onready var mem_body = mem.get_child(1) #https://docs.godotengine.org/en/stable/classes/class_node.html#class-node-method-get-child
@onready var mem_collision = mem.get_child(1).get_child(0)
@onready var timer = $Timer
@onready var energy = $CharacterBody2D/Camera2D/CanvasLayer
@onready var lambmemory = $CharacterBody2D/Camera2D/LambMemory
@onready var memory2 = $Node2D
@onready var mem2_body = memory2.get_child(0)
@onready var mem2_collision = memory2.get_child(1)
@onready var textmemory = $CharacterBody2D/Camera2D/Node2D2
@onready var poemmemory = $CharacterBody2D/Camera2D/Node2D
@onready var memory3 = $Node2D2
@onready var mem3_body = memory3.get_child(0)
@onready var mem3_collision = memory3.get_child(1)
@onready var memory4 = $Area2D
@onready var imagememory = $CharacterBody2D/Camera2D/Node2D3
@onready var videomemory = $CharacterBody2D/Camera2D/VideoStreamPlayer
@onready var memory5 = $Area2D2
@onready var player_anim = $CharacterBody2D/AnimationPlayer
signal start_cut
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_anim.active = false
	lambmemory.get_child(0).hide()
	lambmemory.get_child(1).hide()
	energy.hide()
	mem.hide()
	memory2.hide()
	memory3.hide()
	memory4.hide()
	memory5.hide()
	textmemory.hide()
	poemmemory.hide()
	imagememory.hide()
	videomemory.hide()
	TextBox.hide()
	TextBox.queue_text("What a good dog.")
	TextBox.queue_text("But...there are other ghosts here?")
	TextBox.queue_text("Where do I find them?")
	TextBox.show()
	load_textbox()
	await TextBox.on_display_finished
	ghost.set_inactive()
	mem.show()
	timer.start()
	mem_collision.disabled = true
	mem_body.clicked_ball.connect(handle_clicked_ball)#https://www.youtube.com/watch?v=tSdvGwEz2Y8
	memory2.clicked_ball2.connect(handle_clicked_ball2)
	memory3.clicked_ball3.connect(handle_clicked_ball_3)
	memory4.clicked_ball4.connect(handle_clicked_ball4)
	memory5.clicked_ball5.connect(handle_clicked_ball5)
	await start_cut
	ghost.set_inactive()
	TextBox.queue_text("winter?")
	TextBox.queue_text("WINTER???")
	TextBox.queue_text("WINTER!!!")
	TextBox.show()
	load_textbox()
	await TextBox.on_display_finished
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://cut_scene2.tscn")
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func load_textbox():
	ghost.set_inactive()
	TextBox.show_textbox()
	TextBox.display_text()
	await TextBox.on_display_finished
	ghost.set_active()
func _on_timer_timeout():
	print("timer done")
	TextBox.queue_text("What the heck is that?")
	TextBox.queue_text("No, Wait!")
	TextBox.queue_text("Come here!")
	TextBox.show()
	load_textbox()
	mem_collision.disabled = false #https://forum.godotengine.org/t/how-can-i-enable-and-disable-collisions-from-script/20731/3
	
func handle_clicked_ball():
	print("YOU CLICKED THE BALLLLLLLLL")
	mem.hide()
	#Transition.transition()
	#await Transition.on_transition_finished
	lambmemory.get_child(0).show()
	lambmemory.get_child(1).show()
	print("hello")
	lambmemory.post_chop.connect(transition_back)
func handle_clicked_ball2():
	print("YOU CLICKED THE BALLLLLLLLL")
	Transition.transition()
	memory2.hide()
	energy.increment_energy_value()
	energy.hide()
	await Transition.on_transition_finished
	textmemory.show()
	textmemory.enter_pressed.connect(on_text_pressed)
func handle_clicked_ball_3():
	Transition.transition()
	memory3.hide()
	energy.increment_energy_value()
	energy.hide()
	await Transition.on_transition_finished
	poemmemory.show()
	poemmemory.enter_pressed3.connect(on_poem_pressed)
func handle_clicked_ball4():
	Transition.transition()
	memory4.hide()
	energy.increment_energy_value()
	energy.hide()
	await Transition.on_transition_finished
	imagememory.show()
	imagememory.enter_pressed4.connect(on_image_pressed)
	
func handle_clicked_ball5():
	Transition.transition()
	memory5.hide()
	energy.increment_energy_value()
	energy.hide()
	await Transition.on_transition_finished
	videomemory.show()
	videomemory.enter_pressed5.connect(on_video_pressed)
	
func transition_back():
	lambmemory.get_child(0).hide()
	lambmemory.get_child(1).hide()
	energy.increment_energy_value()
	energy.show()
	TextBox.queue_text("Strange...")
	TextBox.queue_text("Whatever that was, maybe there are more around here.")
	TextBox.show()
	load_textbox()
	memory2.show()
	
func on_text_pressed():
	textmemory.hide()
	energy.show()
	TextBox.queue_text("It's like stepping into another universe!")
	TextBox.queue_text("Gah, this is starting to make my head hurt")
	TextBox.show()
	load_textbox()
	memory3.show()
func on_poem_pressed():
	poemmemory.hide()
	energy.show()
	TextBox.queue_text("A poem?????")
	TextBox.queue_text("Could this be my subconcious?")
	TextBox.show()
	load_textbox()
	memory4.show()
func on_image_pressed():
	imagememory.hide()
	energy.show()
	TextBox.queue_text("When I touch these orbs..")
	TextBox.queue_text("It's like...they're like glimpses into a mind.")
	TextBox.queue_text("Is it another ghost?")
	TextBox.show()
	load_textbox()
	memory5.show()
func on_video_pressed():
	videomemory.hide()
	energy.show()
	TextBox.queue_text("That was Winter.")
	TextBox.queue_text("Are these...are these HER\nmemories?")
	TextBox.queue_text("Is she here??????")
	TextBox.show()
	load_textbox()
	await TextBox.on_display_finished
	start_cut.emit()
