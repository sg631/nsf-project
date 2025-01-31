extends Tree


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(Globals.config.computer.applications.code_editor.functions)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _get_drag_data(_at_position: Vector2) -> Variant:
	var items := []
	var next: TreeItem = get_next_selected(null)
	var v := VBoxContainer.new()
	while next:
		if get_root() == next.get_parent():
			items.append(next)
			var l := Label.new()
			l.text = next.get_text(0)
			v.add_child(l)
		next = get_next_selected(next)
	set_drag_preview(v)
	return items

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	drop_mode_flags = Tree.DROP_MODE_INBETWEEN
	var drop_section := get_drop_section_at_position(at_position)
	if drop_section == -100:
		return false
	var item := get_item_at_position(at_position)
	if item in data:
		return false
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	var drop_section := get_drop_section_at_position(at_position)
	var other_item := get_item_at_position(at_position)
	var sprite_groups := []
	for i in data.size():
		var item := data[i] as TreeItem
		if drop_section == -1:
			item.move_before(other_item)
		elif drop_section == 1:
			if i == 0:
				item.move_after(other_item)
			else:
				item.move_after(data[i - 1])
