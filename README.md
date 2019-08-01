# Godot Editor Icons Previewer

Godot plugin which adds ability to preview all available icons in Godot Editor.
Can be used to facilitate the process of developing Godot editor plugins without 
the need to import any custom icons.

## Compatibility

Godot 3.1+ compatible.

## Usage

Navigate to `Project` → `Tools` and click `Show Editor Icons` menu option:

![Show Editor Icons](images/show_editor_icons.png)

A window shall popup listing all available editor icons which Godot uses natively
(can also show icons from any custom C++ module):

![Editor Icons](images/editor_icons.gif)

Hovering on icons will show their internal name to be used when developing plugins.
In order to use the icon in your plugins, you can fetch it via code like so:

```gdscript
button.icon = get_icon('Add', 'EditorIcons')
```

To simplify the process even further, you can also get the above snippet by
right-clicking on an icon and it will be copied to your clipboard. Left-clicking 
just copies the raw icon's name.

In some cases, a control might not have a theme inherited from Godot's base 
control as it can be overriden. For a more sophisticated way on how to get an icon
from Godot's base control, see 
[editor_plugin_utils.gd](addons/editor_icon_previewer/editor_plugin_utils.gd).
