tool
extends EditorPlugin

var utils = preload('editor_plugin_utils.gd').new(self)
var icon_container = preload('editor_icon_container.tscn').instance()


func _enter_tree():
	icon_container = preload('editor_icon_container.tscn').instance()
	utils.godot_editor.add_child(icon_container)
	add_tool_menu_item(tr('Show Editor Icons'), self, '_on_show_editor_icons_pressed')

	_update_icons()


func _exit_tree():
	if icon_container:
		icon_container.queue_free()
		remove_tool_menu_item(tr('Show Editor Icons'))


func _on_show_editor_icons_pressed(data):
	icon_container.popup_centered_ratio(0.5)


func _update_icons():
	icon_container.clear()

	var list = utils.get_editor_icons_list()

	for icon_name in list:
		var icon = utils.get_editor_icon(icon_name)
		icon_container.add_icon(icon, icon_name)
