package electron.main;

/**
	

### Class: TouchBar

> Create TouchBar layouts for native macOS applications

Process: Main

	See: <https://electronjs.org/docs/api/touch-bar>
**/
@:require(js, hxelectron) @:jsRequire("electron", "TouchBar") extern class TouchBar extends js.node.events.EventEmitter<electron.main.TouchBar> {
	/**
		A `TouchBarItem` that will replace the "esc" button on the touch bar when set. Setting to `null` restores the default "esc" button. Changing this value immediately updates the escape item in the touch bar.
	**/
	var escapeItem : Dynamic;
	function new(options:{ @:optional
	var items : haxe.extern.EitherType<TouchBarButton, haxe.extern.EitherType<TouchBarColorPicker, haxe.extern.EitherType<TouchBarGroup, haxe.extern.EitherType<TouchBarLabel, haxe.extern.EitherType<TouchBarPopover, haxe.extern.EitherType<TouchBarScrubber, haxe.extern.EitherType<TouchBarSegmentedControl, haxe.extern.EitherType<TouchBarSlider, TouchBarSpacer>>>>>>>>; @:optional
	var escapeItem : Null<haxe.extern.EitherType<TouchBarButton, haxe.extern.EitherType<TouchBarColorPicker, haxe.extern.EitherType<TouchBarGroup, haxe.extern.EitherType<TouchBarLabel, haxe.extern.EitherType<TouchBarPopover, haxe.extern.EitherType<TouchBarScrubber, haxe.extern.EitherType<TouchBarSegmentedControl, haxe.extern.EitherType<TouchBarSlider, TouchBarSpacer>>>>>>>>>; }):Void;
}

/**
**/
@:require(js, hxelectron) enum abstract TouchBarEvent(String) from String to String {

}