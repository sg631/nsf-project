extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func handle_input():
	print("input now handled")
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN;
	Globals.usingComputer = true;
func _input(event):
	if event is InputEventMouseMotion:
		var translated_position = translate_mouse_position(event.position, get_viewport().get_visible_rect().size, Vector2(1152, 648))
		
		# Create a new InputEventMouseMotion with the translated position
		var new_event = InputEventMouseMotion.new()
		new_event.position = translated_position
		new_event.relative = event.relative
		new_event.velocity = event.velocity
		
		# Propagate the new event to the virtual screen
		$/root/Game/HomeBase/Computer/SubViewport.push_input(new_event)
		$/root/Game/HomeBase/Computer/SubViewport/ScreenSelectMenu/CanvasLayer/Cursor.position = translated_position
	if event is InputEventMouseButton:
		var new_event = InputEventMouseButton.new();
		new_event.button_index = event.button_index;
		new_event.pressed = event.pressed;
		new_event.position = $/root/Game/HomeBase/Computer/SubViewport/ScreenSelectMenu/CanvasLayer/Cursor.position;
		$/root/Game/HomeBase/Computer/SubViewport.push_input(new_event)

func translate_mouse_position(mouse_pos: Vector2, screen_size: Vector2, virtual_screen_size: Vector2) -> Vector2:
	var x_ratio = virtual_screen_size.x / screen_size.x
	var y_ratio = virtual_screen_size.y / screen_size.y
	return Vector2(mouse_pos.x * x_ratio, mouse_pos.y * y_ratio)
