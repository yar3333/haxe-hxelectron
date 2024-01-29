package electron.main;

/**
	> Create a popover in the touch bar for native macOS applications

Process: Main<br /> _This class is not exported from the `'electron'` module. It is only available as a return value of other methods in the Electron API._

	See: <https://electronjs.org/docs/api/touch-bar-popover>
**/
@:require(js, hxelectron) @:jsRequire("electron", "TouchBarPopover") extern class TouchBarPopover extends js.node.events.EventEmitter<electron.main.TouchBarPopover> {
	/**
		A `string` representing the popover's current button text. Changing this value immediately updates the popover in the touch bar.
	**/
	var label : String;
	/**
		A `NativeImage` representing the popover's current button icon. Changing this value immediately updates the popover in the touch bar.
	**/
	var icon : NativeImage;
	function new(options:{ /**
		Popover button text.
	**/
	@:optional
	var label : String; /**
		Popover button icon.
	**/
	@:optional
	var icon : NativeImage; /**
		Items to display in the popover.
	**/
	var items : TouchBar; /**
		`true` to display a close button on the left of the popover, `false` to not show it. Default is `true`.
	**/
	@:optional
	var showCloseButton : Bool; }):Void;
}

/**
**/
@:require(js, hxelectron) enum abstract TouchBarPopoverEvent(String) from String to String {

}