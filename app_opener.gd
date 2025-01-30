extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _pressed() -> void:
	var newest_window = Window.new()
	newest_window.title = get_meta("Name");
	tooltip_text = get_meta("Description")
	newest_window.add_child(load(get_meta("Path")).instantiate());
	newest_window.position.x = 200;
	newest_window.position.y = 200;
	newest_window.size.x = get_viewport_rect().size.x - 400;
	newest_window.size.y = get_viewport_rect().size.y - 400;
	$"/root/Game/HomeBase/Computer/Computer/ScreenContainer/WindowContainer/".add_child(newest_window)
