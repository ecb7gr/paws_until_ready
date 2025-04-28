extends Node2D
@onready var speech = $AnimatedSprite2D/RichTextLabel
@onready var anim = $AnimatedSprite2D/AnimationPlayer
@onready var winter = $AnimatedSprite2D
@onready var timer = $Timer
@onready var timer2 = $Timer2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speech.visible = false
	TextBox.queue_text("Winter, I...I don't understand what's going on.")
	TextBox.queue_text("I think I'm getting snapshots...No, feelings? No.")
	TextBox.queue_text("Thoughts? I...")


	TextBox.show()
	TextBox.display_text()
	await TextBox.on_display_finished
	speech.visible = true
	TextBox.queue_text("It's alright. Yes, those are mine.")
	TextBox.queue_text("Well, they're kind of mine,")
	TextBox.queue_text("But also kind of like reflections in a rippled lake.")
	TextBox.queue_text("Even so, I wanted you to have them.")
	TextBox.queue_text("And now that you do, do you feel any different?")
	TextBox.show()
	TextBox.display_text()
	await TextBox.on_display_finished
	speech.visible = false
	TextBox.queue_text("Kind of...")
	TextBox.queue_text("I feel, I don't know, less ghostly?")
	TextBox.queue_text("Like I could pick up a pencil with the hand I don't have")
	TextBox.hide()
	TextBox.show()
	TextBox.show_queue()
	TextBox.display_text()
	await TextBox.on_display_finished
	
	timer.start()
	await timer.timeout
	TextBox.show_queue()
	speech.visible = true
	TextBox.hide()
	TextBox.queue_text("Good.")
	TextBox.queue_text("Try taking that hand")
	TextBox.queue_text("And reach it out into the universe")
	TextBox.queue_text("If you have enough corporeal energy,")
	TextBox.queue_text("Another ghost might just grab on")
	TextBox.queue_text("When it does, you'll probably feel a tug")
	TextBox.show_queue()
	TextBox.show()
	TextBox.display_text()
	await TextBox.on_display_finished
	speech.visible = false
	anim.play("new_animation")
	await anim.animation_finished
	timer2.start()
	await timer2.timeout
	TextBox.queue_text("Well, that seemed like a pretty sizeable 'tug'")
	TextBox.display_text()
	await TextBox.on_display_finished
	
	speech.visible = true
	timer2.start()
	await timer2.timeout
	TextBox.hide()
	TextBox.queue_text("Yeah, you definitely grabbed something!")
	TextBox.queue_text("When you return home, it should be there waiting for you.")
	TextBox.queue_text("I'll see you soon. Goodbye.")
	TextBox.show_queue()
	TextBox.show()
	TextBox.display_text()
	await TextBox.on_display_finished
	
	speech.visible = false
	timer.start()
	await timer.timeout
	print("hi")
	TextBox.hide()
	TextBox.queue_text("Hey, Winter?")
	TextBox.queue_text("When we were together, did you feel like I understood you?")
	TextBox.show()
	TextBox.display_text()
	await TextBox.on_display_finished
	speech.visible = true
	timer.start()
	await timer.timeout
	TextBox.hide()
	TextBox.show()
	TextBox.queue_text("You were my best friend.")
	TextBox.display_text()
	await TextBox.on_display_finished
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://a_very_sad_dog.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
