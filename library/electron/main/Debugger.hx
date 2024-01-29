package electron.main;

/**
	

	See: <https://electronjs.org/docs/api/debugger>
**/
@:require(js, hxelectron) @:jsRequire("electron", "Debugger") extern class Debugger extends js.node.events.EventEmitter<electron.main.Debugger> {
	/**
		Attaches the debugger to the `webContents`.
	**/
	function attach(?protocolVersion:String):Void;
	/**
		Whether a debugger is attached to the `webContents`.
	**/
	function isAttached():Bool;
	/**
		Detaches the debugger from the `webContents`.
	**/
	function detach():Void;
	/**
		A promise that resolves with the response defined by the 'returns' attribute of the command description in the remote debugging protocol or is rejected indicating the failure of the command.
		
		Send given command to the debugging target.
	**/
	function sendCommand(method:String, ?commandParams:Dynamic, ?sessionId:String):js.lib.Promise<Dynamic>;
}

/**
**/
@:require(js, hxelectron) enum abstract DebuggerEvent(String) from String to String {
	/**
		Emitted when the debugging session is terminated. This happens either when `webContents` is closed or devtools is invoked for the attached `webContents`.
	**/
	var detach : String = "detach";
	/**
		Emitted whenever the debugging target issues an instrumentation event.
	**/
	var message : String = "message";
}