extends Node
const item_defs = {
	"wood":{
		"displayName":"Wood",
		"iconPath":"res://textures/2100_item-bg.png",
		"tool":{
			"isTool":false,
			"modelPath":"",
			"durability": {
				"current":0,
				"max":100,
				"infinite":false
			},
		"recipes":[]
		}
	},
	"iron-pickaxe":{
		"displayName":"Iron Pickaxe",
		"iconPath":"res://textures/item-thumbnails/pickaxe.png",
		"tool":{
			"isTool":true,
			"modelPath": "res://models/2100-base-pickaxe.obj",
			"durability": {
				"current": 0,
				"max": 100,
				"infinite":false
			}
		},
		"recipes":[
			[{"name":"iron", "count":5},{"name":"wood", "count":10}]
		]
	}
}
var inventory = [
	"iron-pickaxe",
	"wood",
]
var inventoryNumber = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	context_label("Hello. You are the project coordinator of the  Mars Retreat and Rebound Initiative. Welcome to Mars. Your first task here today will be to establish the  living quarters for the first batch of new recruits, and work with them to take the next steps, assuming the responsibilities of a new nation. Your task is not a small one, being no less than recruiting entire nations under one cause: survival.Good luck, you'll need it.")

func context_label(text:String, nonstutter_timecap_enabled:bool = false, nonstutter_timecap:float = 0, stutter:bool = true, stutter_delay:int = 50, pause_symbols_enabled:bool = true, pause_symbol_delay:int = 500, pause_symbols:Array = [",", ".", "?", "!"]):
	#TODO - Make so if iteration of letter in stutter is greater than seventy, add an enter.
	get_node("/root/Game/Control/ContextLabel").text = "";
	if !stutter:
		get_node("/root/Game/Control/ContextLabel").text = text;
		if nonstutter_timecap_enabled && nonstutter_timecap != 0:
			await get_tree().create_timer(nonstutter_timecap).timeout;
			get_node("/root/Game/Control/ContextLabel").text = "";
	if stutter:
		var _iteration = 0;
		print("stutter enabled")
		for letter in text:
			print("now adding letter '" + letter + "' in text " + text + " with delay of " + str(stutter_delay) + "ms")
			await get_tree().create_timer(0.05).timeout;
			get_node("/root/Game/Control/ContextLabel").text += letter;
			get_node("/root/Game/Audio/Sounds/Typing").play()
			if pause_symbols_enabled:
				for pausesymbol in pause_symbols:
					if letter == pausesymbol:
						await get_tree().create_timer(0.05).timeout;
			if _iteration > 62 && letter == " ":
				get_node("/root/Game/Control/ContextLabel").text += "\n";
				_iteration = 0;
			_iteration+=1;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_released("nextInventoryItem")):
		inventoryNumber += 1
	if(Input.is_action_just_released("previousInventoryItem")):
		inventoryNumber -= 1
	if (inventoryNumber < 0):
		inventoryNumber = 0;
	if(inventoryNumber > len(inventory) - 1):
		inventoryNumber = len(inventory) - 1
	var borderedInventoryStyleBox: StyleBoxFlat = get_node("/root/Game/Control/PanelContainer/HBoxContainer/Slot" + str(inventoryNumber+1)).get_theme_stylebox("panel").duplicate()
	borderedInventoryStyleBox.border_width_left = 10;
	borderedInventoryStyleBox.border_width_right = 10;
	borderedInventoryStyleBox.border_width_top = 10;
	borderedInventoryStyleBox.border_width_bottom = 10;
	get_node("/root/Game/Control/PanelContainer/HBoxContainer/Slot" + str(inventoryNumber+1)).add_theme_stylebox_override("panel", borderedInventoryStyleBox)
	var _iteration = 0;
	for string in inventory:
		var borderlessInventoryStyleBox: StyleBoxFlat = get_node("/root/Game/Control/PanelContainer/HBoxContainer/Slot" + str(_iteration+1)).get_theme_stylebox("panel").duplicate()
		get_node("/root/Game/Control/PanelContainer/HBoxContainer/Slot" + str(_iteration+1) + "/Image").set_texture(load(item_defs[string].iconPath));
		borderlessInventoryStyleBox.border_width_left = 0;
		borderlessInventoryStyleBox.border_width_right = 0;
		borderlessInventoryStyleBox.border_width_top = 0;
		borderlessInventoryStyleBox.border_width_bottom = 0;
		if (_iteration != inventoryNumber):
			get_node("/root/Game/Control/PanelContainer/HBoxContainer/Slot" + str(_iteration+1)).add_theme_stylebox_override("panel", borderlessInventoryStyleBox)
		_iteration += 1;
	if(item_defs[inventory[inventoryNumber]].tool.isTool && item_defs[inventory[inventoryNumber]].tool.modelPath != ""):
		get_node("/root/Game/Player/Player/Camera3D/3dhud/held_item").visible = true;
		var _tempMeshStorage = load(item_defs[inventory[inventoryNumber]].tool.modelPath);
		get_node("/root/Game/Player/Player/Camera3D/3dhud/held_item").mesh = _tempMeshStorage;
	else:
		get_node("/root/Game/Player/Player/Camera3D/3dhud/held_item").hide()
	#print(get_node("/root/Game/Control/PanelContainer/HBoxContainer/Slot2").get_theme_stylebox("panel").border_width_left)
