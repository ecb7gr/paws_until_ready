extends Node2D
@onready var chocie1 = $RichTextLabel
@onready var choice2 = $RichTextLabel2
@onready var choice3 = $RichTextLabel3
@onready var choice4 = $RichTextLabel4
@onready var choice5 = $RichTextLabel5
@onready var conclusion = $RichTextLabel6
var tween
var bad = 0
var good = 0
signal next_choice
var done = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	choice2.hide()
	chocie1.hide()
	choice3.hide()
	choice4.hide()
	choice5.hide()
	conclusion.hide()
	Transition.transition()
	await Transition.on_transition_finished
	chocie1.show()
	await next_choice
	Transition.transition()
	await Transition.on_transition_finished
	chocie1.hide()
	choice2.show()
	await next_choice
	Transition.transition()
	await Transition.on_transition_finished
	choice2.hide()
	choice3.show()
	await next_choice
	Transition.transition()
	await Transition.on_transition_finished
	choice3.hide()
	choice4.show()
	await next_choice
	Transition.transition()
	await Transition.on_transition_finished
	choice4.hide()
	choice5.show()
	await next_choice
	Transition.transition()
	await Transition.on_transition_finished
	choice5.hide()
	Transition.transition()
	await Transition.on_transition_finished
	conclusion.show()
	conclusion.visible_characters = 0
	if good > bad:
		conclusion.text = "A ghost eagerly grabs hold, and the dog lights up. Their connection appears natural, intrinsic, even. You'll miss the dog, but you find comfort knowing that it has just secured itself a beautiful, eternal friendship."
	else:
		conclusion.text = "Something grabs on, but the dog, shying from the ghost, will not leave your side.\n\nYou feel its energy slip away, but you both know that you can try this again. You will come back for the dog, and it will be waiting. This is not the end."
	tween = create_tween()
	tween.tween_property(conclusion, "visible_characters", len(conclusion.text), len(conclusion.text) * 0.06)
	await tween.finished
	print("Press enter if your name is Jason Bennett, Brad Pasanek")
	done = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_text_completion_accept") && done:
		get_tree().change_scene_to_file("res://thanks.tscn")
	pass


func _on_button_pressed() -> void:
	bad = bad + 1
	next_choice.emit()
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	good = good + 1
	next_choice.emit()
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	bad = bad + 1
	next_choice.emit()
	pass # Replace with function body.


func _on_button_4_pressed() -> void:
	good = good + 1
	next_choice.emit()
	pass # Replace with function body.


func _on_button_5_pressed() -> void:
	good = good + 1
	next_choice.emit()
	pass # Replace with function body.


func _on_button_6_pressed() -> void:
	bad = bad + 1
	next_choice.emit()
	pass # Replace with function body.
