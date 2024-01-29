package electron.main;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "netLog") extern class NetLog {
	/**
		resolves when the net log has begun recording.
		
		Starts recording network events to `path`.
	**/
	static function startLogging(path:String, ?options:{ /**
		What kinds of data should be captured. By default, only metadata about requests will be captured. Setting this to `includeSensitive` will include cookies and authentication data. Setting it to `everything` will include all bytes transferred on sockets. Can be `default`, `includeSensitive` or `everything`.
	**/
	@:optional
	var captureMode : String; /**
		When the log grows beyond this size, logging will automatically stop. Defaults to unlimited.
	**/
	@:optional
	var maxFileSize : Float; }):js.lib.Promise<Void>;
	/**
		resolves when the net log has been flushed to disk.
		
		Stops recording network events. If not called, net logging will automatically end when app quits.
	**/
	static function stopLogging():js.lib.Promise<Void>;
}