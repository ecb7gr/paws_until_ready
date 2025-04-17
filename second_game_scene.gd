extends Node2D
@onready var ghost = $CharacterBody2D
@onready var mem = $little_moving_thing
@onready var mem_body = mem.get_child(1) #https://docs.godotengine.org/en/stable/classes/class_node.html#class-node-method-get-child
@onready var mem_collision = mem.get_child(1).get_child(0)
@onready var timer = $Timer
@onready var energy = $CharacterBody2D/Camera2D/CanvasLayer
@onready var lambmemory = $CharacterBody2D/Camera2D/LambMemory

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lambmemory.get_child(0).hide()
	lambmemory.get_child(1).hide()
	energy.hide()
	mem.hide()
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
	
func transition_back():
	lambmemory.get_child(0).hide()
	lambmemory.get_child(1).hide()
	energy.increment_energy_value()
	energy.show()
	TextBox.queue_text("Wow, if I still had tear ducts, I would have shed a tear.")
	TextBox.queue_text("But I feel...more energized?")
	TextBox.queue_text("Maybe there are more of those things around here...")
	TextBox.show()
	load_textbox()
	
