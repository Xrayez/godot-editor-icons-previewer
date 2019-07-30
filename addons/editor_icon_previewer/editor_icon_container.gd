tool
extends AcceptDialog

const MIN_ICON_SIZE = 16
var icon_size = MIN_ICON_SIZE


func add_icon(p_icon, p_hint_tooltip = ''):
	var tr = TextureRect.new()
	tr.expand = true
	tr.texture = p_icon
	tr.rect_min_size = Vector2(icon_size, icon_size)
	tr.hint_tooltip = p_hint_tooltip

	$vbox/scroll/container.add_child(tr)


func clear():
	for idx in $vbox/scroll/container.get_child_count():
		var tr = $vbox/scroll/container.get_child(idx)
		tr.free()


func _on_size_changed(pixels):
	icon_size = int(pixels)
	_update_icons(icon_size)


func _update_icons(pixels):
	for idx in $vbox/scroll/container.get_child_count():
		var tr = $vbox/scroll/container.get_child(idx)
		tr.rect_min_size = Vector2(pixels, pixels)
		tr.rect_size = tr.rect_min_size

	var sep = $vbox/scroll/container.get_constant('hseparation')
	var cols = get_rect().size.x / (pixels + sep)
	$vbox/scroll/container.columns = cols - 2 # FIXME: fit window properly

	$vbox/params/pixels.text = str(pixels)


func _on_window_visibility_changed():
	call_deferred('_update_icons', icon_size)


func _on_window_resized():
	_update_icons(icon_size)
