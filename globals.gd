extends Node
const item_defs = {
	"wood":{
		"displayName":"Wood",
		"iconPath":"res://textures/icon.svg",
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
		"iconPath":"res://textures/notfound.png",
		"tool":{
			"isTool":true,
			"modelPath": "res://2100-base-pickaxe.obj",
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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("nextInventoryItem")):
		inventoryNumber += 1
	if(Input.is_action_just_pressed("nextInventoryItem")):
		inventoryNumber -= 1
	if (inventoryNumber < 0):
		inventoryNumber = 0;
	for string in inventory:
		get_node("/root/Game/Control/PanelContainer/HBoxContainer/Slot" + str(inventory.find(string)+1) + "/Image").set_texture(load(item_defs[string].iconPath));
	get_node("/root/Game/Control/PanelContainer/HBoxContainer/Slot" + str(inventoryNumber+1))
