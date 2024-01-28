package electron.main;

/**
	

	See: <https://electronjs.org/docs/api/message-channel-main>
**/
@:require(js, hxelectron) @:jsRequire("electron", "MessageChannelMain") extern class MessageChannelMain extends js.node.events.EventEmitter<electron.main.MessageChannelMain> {
	/**
		A `MessagePortMain` property.
	**/
	var port1 : MessagePortMain;
	/**
		A `MessagePortMain` property.
	**/
	var port2 : MessagePortMain;
}

/**
**/
@:require(js, hxelectron) enum abstract MessageChannelMainEvent(String) from String to String {

}