extends CharacterBody2D #https://forum.godotengine.org/t/smooth-movement-without-gravity/23075/2
var speed = 100
var friction = 0.05
var acceleration = 0.05
var inactive = false
func _physics_process(delta):
	if inactive:
		return
	var input_velocity = Vector2.ZERO
	# Check input for "desired" velocity
	if Input.is_action_pressed("ui_right"):
		input_velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		input_velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		input_velocity.y -= 1
	input_velocity = input_velocity.normalized() * speed

	# If there's input, accelerate to the input velocity
	if input_velocity.length() > 0:
		velocity = velocity.lerp(input_velocity, acceleration)
	else:
		# No input: apply friction to slow down
		velocity = velocity.lerp(Vector2.ZERO, friction)
	move_and_slide()# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func set_inactive():
	velocity=Vector2.ZERO
	inactive = true
func  set_active():
	inactive = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
