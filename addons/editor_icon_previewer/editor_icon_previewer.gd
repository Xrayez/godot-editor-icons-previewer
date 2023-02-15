@tool
extends EditorPlugin

var icon_window
var suppress_warnings = false
@onready var property_input = $OptionButton


func _enter_tree():
	assert(Engine.get_version_info().major >= 3)

	icon_window = preload('editor_icon_window.tscn').instantiate()
	get_editor_interface().get_base_control().add_child(icon_window)
	icon_window.update_request.connect(_on_update_requested)
	icon_window.plugin = self

	add_icons_menu_item(tr('Show Editor Icons'), '_on_show_editor_icons_pressed')


func _exit_tree():
	if icon_window:
		icon_window.queue_free()
		remove_icons_menu_item(tr('Show Editor Icons'))


func add_icons_menu_item(p_name, p_callback):
	if Engine.get_version_info().hex >= 0x030100:
		add_tool_menu_item(p_name, Callable(self, p_callback))


func remove_icons_menu_item(p_name):
	if Engine.get_version_info().hex >= 0x030100:
		remove_tool_menu_item(p_name)


func _on_show_editor_icons_pressed():
	icon_window.display()


func _on_update_requested():
	_populate_icons()


func _populate_icons():
	icon_window.clear()

	var godot_theme = get_editor_interface().get_base_control().theme

	var list = Array(godot_theme.get_icon_list('EditorIcons'))
	list.sort() # alphabetically

	var no_name = []

	for icon_name in list:
		var icon_tex = godot_theme.get_icon(icon_name, 'EditorIcons')

		if icon_name.is_empty():
			no_name.append(icon_tex)
			continue

		icon_window.add_icon(icon_tex, icon_name)

	if not suppress_warnings:
		if no_name.size() > 0:
			push_warning("EditorIconsPreviewer: detected %s icons with no name set, skipping." % no_name.size())


func convert_to_texture():
	var selected_nodes = get_editor_interface().get_selection().get_transformable_selected_nodes()
	if selected_nodes.size() > 0:
		var selected_node = get_editor_interface().get_selection().get_transformable_selected_nodes()[0]
		var selected_node_path = selected_node.get_path()
		var properties = selected_node.get_property_list()
		
#		icon_rect.texture = get_icon(selected_node.get_class())
#		node_input.text = selected_node_path
		
		property_input.clear()
		for p in properties:
			if p["class_name"] == "Texture": property_input.add_item(p.name)
		
#		selected_node.set(property_input.get_item_text(property_input.selected), get_icon( .hint_tooltip))





