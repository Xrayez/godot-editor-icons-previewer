tool
extends EditorPlugin

var utils
var icon_window


func _enter_tree():
	utils = preload('editor_plugin_utils.gd').new(self)

	icon_window = preload('editor_icon_window.tscn').instance()
	utils.godot_editor.add_child(icon_window)

	add_tool_menu_item(tr('Show Editor Icons'), self, '_on_show_editor_icons_pressed')

	_update_icons()


func _exit_tree():
	if icon_window:
		icon_window.queue_free()
		remove_tool_menu_item(tr('Show Editor Icons'))


func _on_show_editor_icons_pressed(_data):
	icon_window.popup_centered_ratio(0.5)


func _update_icons():
	icon_window.clear()

	var list = utils.get_editor_icons_list()

	for icon_name in list:
		var icon = utils.get_editor_icon(icon_name)
		icon_window.add_icon(icon, icon_name)
