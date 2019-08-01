tool
extends EditorPlugin

var icon_window


func _enter_tree():
	icon_window = preload('editor_icon_window.tscn').instance()
	get_editor_interface().get_base_control().add_child(icon_window)
	add_tool_menu_item(tr('Show Editor Icons'), self, '_on_show_editor_icons_pressed')


func _exit_tree():
	if icon_window:
		icon_window.queue_free()
		remove_tool_menu_item(tr('Show Editor Icons'))


func _ready():
	_update_icons()


func _on_show_editor_icons_pressed(_data):
	icon_window.display()


func _update_icons():
	icon_window.clear()

	var godot_theme = get_editor_interface().get_base_control().theme

	var list = Array(godot_theme.get_icon_list('EditorIcons'))
	list.sort() # alphabetically

	for icon_name in list:
		var icon = godot_theme.get_icon(icon_name, 'EditorIcons')
		icon_window.add_icon(icon, icon_name)
