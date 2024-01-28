package electron.remote;

/**
	

### Class: TouchBar

> Create TouchBar layouts for native macOS applications

Process: Main

	See: <https://electronjs.org/docs/api/touch-bar>
**/
@:require(js, hxelectron) @:jsRequire("electron", "remote.TouchBar") extern class TouchBar extends js.node.events.EventEmitter<electron.main.TouchBar> {
	/**
		A `TouchBarItem` that will replace the "esc" button on the touch bar when set. Setting to `null` restores the default "esc" button. Changing this value immediately updates the escape item in the touch bar.
	**/
	var escapeItem : TouchBarItem;
	function new(options:{ @:optional
	var items : Array<Dynamic>; @:optional
	var escapeItem : Dynamic; }):Void;
}

/**
**/
@:require(js, hxelectron) enum abstract TouchBarEvent(String) from String to String {

}