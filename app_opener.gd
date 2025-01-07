extends TextureButton
@onready var menu = $/root/Game/HomeBase/Computer/SubViewport/ScreenSelectMenu
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _pressed() -> void:
	var loaded_app = load("res://apps/" + get_meta("app") + "_app.tscn")
	var appWindow = Window.new()
	if loaded_app != null:
		appWindow.add_child(loaded_app.instantiate())
		menu.add_child(appWindow)
		print("Loading app res://apps/" + get_meta("app") + "_app.tscn")
