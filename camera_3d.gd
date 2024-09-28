extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation.x -= Input.get_last_mouse_velocity().y/10000;
	rotation.y -= Input.get_last_mouse_velocity().x/10000;
