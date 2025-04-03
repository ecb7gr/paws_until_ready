extends CanvasLayer # https://www.youtube.com/watch?v=QC_mn2tX6n0&t=72s
@onready var color_rect = $ColorRect
@onready var anim_player = $AnimationPlayer
signal on_transition_finished
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	color_rect.visible = false
	anim_player.animation_finished.connect(_on_animation_finished)
	pass # Replace with function body.
func transition():
	color_rect.visible = true
	anim_player.play("fade_to_black")
func _on_animation_finished(anim_name):
		if anim_name == "fade_to_black":
			anim_player.play("fade_from_black")
			on_transition_finished.emit()
		elif anim_name == "fade_from_black":
			color_rect.visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
