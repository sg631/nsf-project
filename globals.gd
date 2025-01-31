extends Node

var usingComputer = false;

#func _ready() -> void:
	#context_label("Hello. You are the project coordinator of the  Mars Retreat and Rebound Initiative. Welcome to Mars. Your first task here today will be to establish the  living quarters for the first batch of new recruits, and work with them to take the next steps, assuming the responsibilities of a new nation. Your task is not a small one, being no less than recruiting entire nations under one cause: survival. Good luck, you'll need it.")

func _codeblock_turn_degrees(config, degrees):
	config.rover.rotation.x += degrees * config.delta;
func _codeblock_move_meters(config, speed, distance):
	config.rover.translate(Vector3(0,0,config.delta * speed));
func _codeblock_print_debugger(config, message):
	pass
func _codeblock_collect_sample(config):
	pass
func _codeblock_shift_control(config):
	pass

func _codeexpression_add(config, number, number2):
	return number + number2
func _codeexpression_subtract(config, number, number2):
	return number - number2
func _codeexpression_multiply(config, number, number2):
	return number * number2
func _codeexpression_divide(config, number, number2):
	return number / number2

func _codecheck_not(config, input : bool):
	return !input
func _codecheck_and(config, input1 : bool, input2 : bool):
	return input1 && input2
func _codecheck_or(config, input1 : bool, input2 : bool):
	return input1 || input2
func _codecheck_equals(config, input1, input2):
	return input1 == input2
func _codecheck_lessthan(config, input1, input2):
	return input1 < input2
func _codecheck_greaterthan(config, input1, input2):
	return input1 > input2
func _codecheck_trashready(config):
	return
func _codecheck_pathblocked(config):
	return


var config = {
	"computer":{
		"applications":{
			"code_editor":{
				"functions":{
					"turn_degrees":{
						"name":"Turn Degrees",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codeblock_turn_degrees
					},
					"move_meters":{
						"name":"Move Meters",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codeblock_move_meters
					},
					"collect_sample":{
						"name":"Collect Sample",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codeblock_collect_sample
					},
					"print_debugger":{
						"name":"Print To Console",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codeblock_print_debugger
					},
					"shift_control":{
						"name":"Switch to Manual Driving",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codeblock_shift_control
					}
				},
				"expressions":{
					"addr":{
						"name":"Add",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codeexpression_add
					},
					"subtract":{
						"name":"Subtract",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codeexpression_subtract
					},
					"multiply":{
						"name":"Multiply",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codeexpression_multiply
					},
					"divide":{
						"name":"Divide",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codeexpression_divide
					}
				},
				"checks": {
					"not":{
						"name":"Negate",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codecheck_not
					},
					"and":{
						"name":"And",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codecheck_and
					},
					"or":{
						"name":"Or",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codecheck_or
					},
					"equals":{
						"name":"Equals",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codecheck_equals
					},
					"less_than":{
						"name":"Less Than",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codecheck_lessthan
					},
					"greater_than":{
						"name":"Greater Than",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codecheck_greaterthan
					},
					"trash_available":{
						"name":"Trash Available",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codecheck_trashready
					},
					"path_blocked":{
						"name":"Path Blocked",
						#"icon":"res://textures/hud/computer/icons/blocks/turn_degrees"
						"callable":_codecheck_pathblocked
					}
				}
			}
		}
	}
}

var data = {
	"levels_completed":[],
}

func save():
	var save_dict = {
		"position_x": $/root/Game/Player.position.x,
		"position_y": $/root/Game/Player.position.y,
		"levels_completed": data["levels_completed"]
	}
