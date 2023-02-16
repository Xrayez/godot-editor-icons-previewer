# Godot Editor Icons Previewer

Godot plugin which adds ability to preview all available icons in Godot Editor.
Can be used to facilitate the process of developing neat user interfaces for 
Godot editor plugins without the need to import any custom icons.

## Compatibility

Godot 4.0 compatible.

## Usage

To read the full documentation, which will be kept updated as more features come in, read [the documentation](https://docs.google.com/document/d/1y2aPsn72dOxQ-wBNGqLlQvrw9-SV_z12a1MradBglF4/edit?usp=sharing)

Navigate to `Project` > `Tools` and click `Show Editor Icons` menu option
(<kbd>Alt</kbd>+<kbd>I</kbd> shortcut is also available for this):

![Editor Icons](images/editor_icons.gif)

Hovering on icons will show their internal name to be used when developing plugins.
In order to use the icon in your plugins, you can fetch it via code like so:

```gdscript
button.icon = get_icon('Add', 'EditorIcons')
```
