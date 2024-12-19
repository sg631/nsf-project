extends Camera3D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("exit") && Globals.usingComputer:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED;
		Globals.usingComputer = false;
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotation.x -= Input.get_last_mouse_velocity().y / 10000
	if Input.is_action_just_pressed("camLock") && !Globals.usingComputer:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED;
	if Input.is_action_just_pressed("interact"):  
		var mouse_pos = get_viewport().get_mouse_position()
		var from = project_ray_origin(mouse_pos)
		var to = from + project_ray_normal(mouse_pos) * 1000

		var query = PhysicsRayQueryParameters3D.new()
		query.from = from
		query.to = to
		query.collision_mask = 1
		query.exclude = []

		var space_state = get_world_3d().direct_space_state
		var result = space_state.intersect_ray(query)

		if result:
			var collider = result.get("collider")
			if collider.has_method("handle_input"):
				collider.handle_input()
