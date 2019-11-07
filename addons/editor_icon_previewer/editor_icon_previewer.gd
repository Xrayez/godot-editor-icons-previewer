tool
extends EditorPlugin

var icon_window
var suppress_warnings = false


func _enter_tree():
	assert(Engine.get_version_info().major >= 3)

	icon_window = preload('editor_icon_window.tscn').instance()
	get_editor_interface().get_base_control().add_child(icon_window)

	add_icons_menu_item(tr('Show Editor Icons'), '_on_show_editor_icons_pressed')


func _exit_tree():
	if icon_window:
		icon_window.queue_free()
		remove_icons_menu_item(tr('Show Editor Icons'))


func _ready():
	_update_icons()


func add_icons_menu_item(p_name, p_callback):
	var minor_version = Engine.get_version_info().minor
	if minor_version >= 1:
		add_tool_menu_item(p_name, self, p_callback)


func remove_icons_menu_item(p_name):
	var minor_version = Engine.get_version_info().minor
	if minor_version >= 1:
		remove_tool_menu_item(p_name)


func _on_show_editor_icons_pressed(_data):
	icon_window.display()


func _update_icons():
	icon_window.clear()

	var godot_theme = get_editor_interface().get_base_control().theme

	var list = Array(godot_theme.get_icon_list('EditorIcons'))
	list.sort() # alphabetically

	var no_name = []

	for icon_name in list:
		var icon_tex = godot_theme.get_icon(icon_name, 'EditorIcons')

		if icon_name.empty():
			no_name.append(icon_tex)
			continue

		icon_window.add_icon(icon_tex, icon_name)

	if not suppress_warnings:
		if no_name.size() > 0:
			push_warning("EditorIconsPreviewer: detected %s icons with no name set, skipping." % no_name.size())
