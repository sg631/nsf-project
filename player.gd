extends CharacterBody3D


var SPEED = 5.0
var JUMP_VELOCITY = 6


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor_only():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_pressed("sprint"):
		SPEED = 7

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("playerLeft", "playerRight", "playerForwards", "playerBackwards")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	#rotation.x -= Input.get_last_mouse_velocity().y/10000;
	rotation.y -= Input.get_last_mouse_velocity().x/10000;
	if Input.is_action_just_pressed("camLock"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED;
	
	if Input.is_action_just_pressed("exit"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	move_and_slide()
