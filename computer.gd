extends StaticBody3D

var menu = load("res://desktop.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func handle_input() -> void:
	Globals.usingComputer = true;
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	add_child(menu)
