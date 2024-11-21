extends Node
const item_defs = {
	"wood":{
		"displayName":"Wood"
	},
	"iron-pickaxe":{
		"displayName":"Iron Pickaxe",
		"recipe":[
			{"name":"iron", "count":5},
			{"name":"wood", "count":10},
		]
	}
}
var inventory = [
	
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Input.action_press("nextInventoryItem")
