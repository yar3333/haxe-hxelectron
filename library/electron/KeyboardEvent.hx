package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/keyboard-event>
**/
@:require(js, hxelectron) typedef KeyboardEvent = {
	/**
		whether the Control key was used in an accelerator to trigger the Event
	**/
	@:optional
	var ctrlKey : Bool;
	/**
		whether a meta key was used in an accelerator to trigger the Event
	**/
	@:optional
	var metaKey : Bool;
	/**
		whether a Shift key was used in an accelerator to trigger the Event
	**/
	@:optional
	var shiftKey : Bool;
	/**
		whether an Alt key was used in an accelerator to trigger the Event
	**/
	@:optional
	var altKey : Bool;
	/**
		whether an accelerator was used to trigger the event as opposed to another user gesture like mouse click
	**/
	@:optional
	var triggeredByAccelerator : Bool;
}