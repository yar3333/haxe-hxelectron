package electron.remote;

/**
	

	See: <https://electronjs.org/docs/api/utility-process>
**/
@:require(js, hxelectron) @:jsRequire("electron", "remote.UtilityProcess") extern class UtilityProcess extends js.node.events.EventEmitter<electron.main.UtilityProcess> {
	/**
		A `Integer | undefined` representing the process identifier (PID) of the child process. If the child process fails to spawn due to errors, then the value is `undefined`. When the child process exits, then the value is `undefined` after the `exit` event is emitted.
	**/
	var pid : Null<Int>;
	/**
		A `NodeJS.ReadableStream | null` that represents the child process's stdout. If the child was spawned with options.stdio[1] set to anything other than 'pipe', then this will be `null`. When the child process exits, then the value is `null` after the `exit` event is emitted.
	**/
	var stdout : Null<NodeJS.ReadableStream>;
	/**
		A `NodeJS.ReadableStream | null` that represents the child process's stderr. If the child was spawned with options.stdio[2] set to anything other than 'pipe', then this will be `null`. When the child process exits, then the value is `null` after the `exit` event is emitted.
	**/
	var stderr : Null<NodeJS.ReadableStream>;
	/**
		Send a message to the child process, optionally transferring ownership of zero or more `MessagePortMain` objects.
		
		For example:
	**/
	function postMessage(message:Dynamic, ?transfer:Array<MessagePortMain>):Void;
	/**
		Terminates the process gracefully. On POSIX, it uses SIGTERM but will ensure the process is reaped on exit. This function returns true if the kill is successful, and false otherwise.
	**/
	function kill():Bool;
}

/**
**/
@:require(js, hxelectron) enum abstract UtilityProcessEvent(String) from String to String {
	/**
		Emitted once the child process has spawned successfully.
	**/
	var spawn : String = "spawn";
	/**
		Emitted after the child process ends.
	**/
	var exit : String = "exit";
	/**
		Emitted when the child process sends a message using `process.parentPort.postMessage()`.
	**/
	var message : String = "message";
}