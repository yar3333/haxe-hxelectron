package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/keyboard-input-event>
**/
@:require(js, hxelectron) typedef KeyboardInputEvent = {
	/**
		The type of the event, can be `rawKeyDown`, `keyDown`, `keyUp` or `char`.
	**/
	var type : String;
	/**
		The character that will be sent as the keyboard event. Should only use the valid key codes in Accelerator.
	**/
	var keyCode : String;
}