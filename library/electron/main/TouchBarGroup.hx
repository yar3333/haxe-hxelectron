package electron.main;

/**
	> Create a group in the touch bar for native macOS applications

Process: Main<br /> _This class is not exported from the `'electron'` module. It is only available as a return value of other methods in the Electron API._

	See: <https://electronjs.org/docs/api/touch-bar-group>
**/
@:require(js, hxelectron) @:jsRequire("electron", "TouchBarGroup") extern class TouchBarGroup extends js.node.events.EventEmitter<electron.main.TouchBarGroup> {
	function new(options:{ /**
		Items to display as a group.
	**/
	var items : TouchBar; }):Void;
}

/**
**/
@:require(js, hxelectron) enum abstract TouchBarGroupEvent(String) from String to String {

}