package electron.remote;

/**
	> Create a color picker in the touch bar for native macOS applications

Process: Main<br /> _This class is not exported from the `'electron'` module. It is only available as a return value of other methods in the Electron API._

	See: <https://electronjs.org/docs/api/touch-bar-color-picker>
**/
@:require(js, hxelectron) @:jsRequire("electron", "remote.TouchBarColorPicker") extern class TouchBarColorPicker extends js.node.events.EventEmitter<electron.main.TouchBarColorPicker> {
	/**
		A `string[]` array representing the color picker's available colors to select. Changing this value immediately updates the color picker in the touch bar.
	**/
	var availableColors : String;
	/**
		A `string` hex code representing the color picker's currently selected color. Changing this value immediately updates the color picker in the touch bar.
	**/
	var selectedColor : String;
	function new(options:{ /**
		Array of hex color strings to appear as possible colors to select.
	**/
	@:optional
	var availableColors : Array<String>; /**
		The selected hex color in the picker, i.e `#ABCDEF`.
	**/
	@:optional
	var selectedColor : String; /**
		Function to call when a color is selected.
	**/
	@:optional
	var change : haxe.Constraints.Function; }):Void;
}

/**
**/
@:require(js, hxelectron) enum abstract TouchBarColorPickerEvent(String) from String to String {

}