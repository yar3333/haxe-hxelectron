null

/**
	

	See: <https://electronjs.org/docs/api/structures/input-event>
**/
@:require(js, hxelectron) typedef InputEvent = {
	/**
		Can be `undefined`, `mouseDown`, `mouseUp`, `mouseMove`, `mouseEnter`, `mouseLeave`, `contextMenu`, `mouseWheel`, `rawKeyDown`, `keyDown`, `keyUp`, `char`, `gestureScrollBegin`, `gestureScrollEnd`, `gestureScrollUpdate`, `gestureFlingStart`, `gestureFlingCancel`, `gesturePinchBegin`, `gesturePinchEnd`, `gesturePinchUpdate`, `gestureTapDown`, `gestureShowPress`, `gestureTap`, `gestureTapCancel`, `gestureShortPress`, `gestureLongPress`, `gestureLongTap`, `gestureTwoFingerTap`, `gestureTapUnconfirmed`, `gestureDoubleTap`, `touchStart`, `touchMove`, `touchEnd`, `touchCancel`, `touchScrollStarted`, `pointerDown`, `pointerUp`, `pointerMove`, `pointerRawUpdate`, `pointerCancel` or `pointerCausedUaAction`.
	**/
	var type : String;
	/**
		An array of modifiers of the event, can be `shift`, `control`, `ctrl`, `alt`, `meta`, `command`, `cmd`, `isKeypad`, `isAutoRepeat`, `leftButtonDown`, `middleButtonDown`, `rightButtonDown`, `capsLock`, `numLock`, `left`, `right`.
	**/
	var modifiers : Array<String>;
}

/**
	

	See: <https://electronjs.org/docs/api/structures/ipc-main-event>
**/
@:require(js, hxelectron) typedef IpcMainEvent = {
	/**
		The internal ID of the renderer process that sent this message
	**/
	var processId : Int;
	/**
		The ID of the renderer frame that sent this message
	**/
	var frameId : Int;
	/**
		Set this to the value to be returned in a synchronous message
	**/
	var returnValue : Any;
	/**
		Returns the `webContents` that sent the message
	**/
	var sender : WebContents;
	/**
		The frame that sent this message
	**/
	var senderFrame : WebFrameMain;
	/**
		A list of MessagePorts that were transferred with this message
	**/
	var ports : Array<MessagePortMain>;
	/**
		A function that will send an IPC message to the renderer frame that sent the original message that you are currently handling.  You should use this method to "reply" to the sent message in order to guarantee the reply will go to the correct process and frame.
	**/
	var reply : haxe.Constraints.Function;
}

/**
	

	See: <https://electronjs.org/docs/api/structures/ipc-main-invoke-event>
**/
@:require(js, hxelectron) typedef IpcMainInvokeEvent = {
	/**
		The internal ID of the renderer process that sent this message
	**/
	var processId : Int;
	/**
		The ID of the renderer frame that sent this message
	**/
	var frameId : Int;
	/**
		Returns the `webContents` that sent the message
	**/
	var sender : WebContents;
	/**
		The frame that sent this message
	**/
	var senderFrame : WebFrameMain;
}

/**
	

	See: <https://electronjs.org/docs/api/structures/ipc-renderer-event>
**/
@:require(js, hxelectron) typedef IpcRendererEvent = {
	/**
		The `IpcRenderer` instance that emitted the event originally
	**/
	var sender : IpcRenderer;
	/**
		A list of MessagePorts that were transferred with this message
	**/
	var ports : Array<MessagePort>;
}

/**
	

	See: <https://electronjs.org/docs/api/structures/keyboard-event>
**/
@:require(js, hxelectron) typedef KeyboardEvent = {
	/**
		whether the Control key was used in an accelerator to trigger the Event
	**/
	var ctrlKey : Bool;
	/**
		whether a meta key was used in an accelerator to trigger the Event
	**/
	var metaKey : Bool;
	/**
		whether a Shift key was used in an accelerator to trigger the Event
	**/
	var shiftKey : Bool;
	/**
		whether an Alt key was used in an accelerator to trigger the Event
	**/
	var altKey : Bool;
	/**
		whether an accelerator was used to trigger the event as opposed to another user gesture like mouse click
	**/
	var triggeredByAccelerator : Bool;
}

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

/**
	

	See: <https://electronjs.org/docs/api/structures/mouse-input-event>
**/
@:require(js, hxelectron) typedef MouseInputEvent = {
	/**
		The type of the event, can be `mouseDown`, `mouseUp`, `mouseEnter`, `mouseLeave`, `contextMenu`, `mouseWheel` or `mouseMove`.
	**/
	var type : String;
	var x : Int;
	var y : Int;
	/**
		The button pressed, can be `left`, `middle`, `right`.
	**/
	var button : String;
	var globalX : Int;
	var globalY : Int;
	var movementX : Int;
	var movementY : Int;
	var clickCount : Int;
}

/**
	

	See: <https://electronjs.org/docs/api/structures/mouse-wheel-input-event>
**/
@:require(js, hxelectron) typedef MouseWheelInputEvent = {
	/**
		The type of the event, can be `mouseWheel`.
	**/
	var type : String;
	var deltaX : Int;
	var deltaY : Int;
	var wheelTicksX : Int;
	var wheelTicksY : Int;
	var accelerationRatioX : Int;
	var accelerationRatioY : Int;
	var hasPreciseScrollingDeltas : Bool;
	var canScroll : Bool;
}