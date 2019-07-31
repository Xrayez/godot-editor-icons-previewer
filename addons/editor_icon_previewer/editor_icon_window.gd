tool
extends AcceptDialog

const MIN_ICON_SIZE = 16
const MAX_ICON_SIZE = 128

var icon_size = MIN_ICON_SIZE
var filter = ''


func _ready():
	$vbox/params/size.min_value = MIN_ICON_SIZE
	$vbox/params/size.max_value = MAX_ICON_SIZE


func add_icon(p_icon, p_hint_tooltip = ''):
	var tr = TextureRect.new()
	tr.expand = true
	tr.texture = p_icon
	tr.rect_min_size = Vector2(icon_size, icon_size)
	tr.hint_tooltip = p_hint_tooltip

	tr.connect('gui_input', self, '_icon_gui_input', [tr])

	$vbox/scroll/container.add_child(tr)


func _icon_gui_input(event, icon):

	if event is InputEventMouseButton and event.pressed:
		OS.clipboard = icon.hint_tooltip
		$vbox/params/info/copied.show()

	elif event is InputEventMouseMotion:
		if event.speed.length() > 25:
			$vbox/params/info/copied.hide()
		$vbox/params/info/icon.text = icon.hint_tooltip


func clear():
	for idx in $vbox/scroll/container.get_child_count():
		var tr = $vbox/scroll/container.get_child(idx)
		tr.free()


func _on_size_changed(pixels):
	icon_size = int(clamp(pixels, MIN_ICON_SIZE, MAX_ICON_SIZE))
	_update_icons()


func _update_icons():
	for idx in $vbox/scroll/container.get_child_count():
		var tr = $vbox/scroll/container.get_child(idx)

		if not filter.is_subsequence_ofi(tr.hint_tooltip):
			tr.visible = false
		else:
			tr.visible = true

		tr.rect_min_size = Vector2(icon_size, icon_size)
		tr.rect_size = tr.rect_min_size

	var sep = $vbox/scroll/container.get_constant('hseparation')
	var cols = get_rect().size.x / (icon_size + sep)
	$vbox/scroll/container.columns = cols - 2 # FIXME: fit window properly

	$vbox/params/pixels.text = str(icon_size) + " px"


func _on_window_visibility_changed():
	call_deferred('_update_icons', icon_size)


func _on_window_resized():
	_update_icons()


func _on_search_text_changed(text):
	filter = text
	_update_icons()
