package electron;

import electron.main.*;

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