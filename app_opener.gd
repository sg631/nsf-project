extends TextureButton
@onready var menu = $/root/Game/HomeBase/Computer/SubViewport/ScreenSelectMenu
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_global_rect().intersects(menu.get_child(1).get_global_rect()) && Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		on_pressed()

func on_pressed() -> void:
	var loaded_app = load("res://apps/" + get_meta("app") + "_app.tscn")
	var appWindow = Window.new()
	if loaded_app != null:
		appWindow.add_child(loaded_app.instantiate())
		menu.add_child(appWindow)
		print("Loading app res://apps/" + get_meta("app") + "_app.tscn")
