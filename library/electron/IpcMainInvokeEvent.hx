package electron;

import electron.main.*;

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