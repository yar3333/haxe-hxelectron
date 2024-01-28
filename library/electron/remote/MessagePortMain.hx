package electron.remote;

/**
	

	See: <https://electronjs.org/docs/api/message-port-main>
**/
@:require(js, hxelectron) @:jsRequire("electron", "remote.MessagePortMain") extern class MessagePortMain extends js.node.events.EventEmitter<electron.main.MessagePortMain> {
	/**
		Sends a message from the port, and optionally, transfers ownership of objects to other browsing contexts.
	**/
	function postMessage(message:Any, ?transfer:Array<MessagePortMain>):Void;
	/**
		Starts the sending of messages queued on the port. Messages will be queued until this method is called.
	**/
	function start():Void;
	/**
		Disconnects the port, so it is no longer active.
	**/
	function close():Void;
}

/**
**/
@:require(js, hxelectron) enum abstract MessagePortMainEvent(String) from String to String {
	/**
		Emitted when a MessagePortMain object receives a message.
	**/
	var message : String = "message";
	/**
		Emitted when the remote end of a MessagePortMain object becomes disconnected.
	**/
	var close : String = "close";
}