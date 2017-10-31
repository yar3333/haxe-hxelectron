package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "contentTracing") extern class ContentTracing {
	/**
		Get a set of category groups. The category groups can change as new code paths are reached. Once all child processes have acknowledged the getCategories request the callback is invoked with an array of category groups.
	**/
	static function getCategories(callback:haxe.Constraints.Function):Void;
	/**
		Start recording on all processes. Recording begins immediately locally and asynchronously on child processes as soon as they receive the EnableRecording request. The callback will be called once all child processes have acknowledged the startRecording request. categoryFilter is a filter to control what category groups should be traced. A filter can have an optional - prefix to exclude category groups that contain a matching category. Having both included and excluded category patterns in the same list is not supported. Examples: traceOptions controls what kind of tracing is enabled, it is a comma-delimited list. Possible options are: The first 3 options are trace recording modes and hence mutually exclusive. If more than one trace recording modes appear in the traceOptions string, the last one takes precedence. If none of the trace recording modes are specified, recording mode is record-until-full. The trace option will first be reset to the default option (record_mode set to record-until-full, enable_sampling and enable_systrace set to false) before options parsed from traceOptions are applied on it.
	**/
	static function startRecording(options:{ @:optional
	var categoryFilter : String; @:optional
	var traceOptions : String; }, callback:haxe.Constraints.Function):Void;
	/**
		Stop recording on all processes. Child processes typically cache trace data and only rarely flush and send trace data back to the main process. This helps to minimize the runtime overhead of tracing since sending trace data over IPC can be an expensive operation. So, to end tracing, we must asynchronously ask all child processes to flush any pending trace data. Once all child processes have acknowledged the stopRecording request, callback will be called with a file that contains the traced data. Trace data will be written into resultFilePath if it is not empty or into a temporary file. The actual file path will be passed to callback if it's not null.
	**/
	static function stopRecording(resultFilePath:String, callback:haxe.Constraints.Function):Void;
	/**
		Start monitoring on all processes. Monitoring begins immediately locally and asynchronously on child processes as soon as they receive the startMonitoring request. Once all child processes have acknowledged the startMonitoring request the callback will be called.
	**/
	static function startMonitoring(options:{ @:optional
	var categoryFilter : String; @:optional
	var traceOptions : String; }, callback:haxe.Constraints.Function):Void;
	/**
		Stop monitoring on all processes. Once all child processes have acknowledged the stopMonitoring request the callback is called.
	**/
	static function stopMonitoring(callback:haxe.Constraints.Function):Void;
	/**
		Get the current monitoring traced data. Child processes typically cache trace data and only rarely flush and send trace data back to the main process. This is because it may be an expensive operation to send the trace data over IPC and we would like to avoid unneeded runtime overhead from tracing. So, to end tracing, we must asynchronously ask all child processes to flush any pending trace data. Once all child processes have acknowledged the captureMonitoringSnapshot request the callback will be called with a file that contains the traced data.
	**/
	static function captureMonitoringSnapshot(resultFilePath:String, callback:haxe.Constraints.Function):Void;
	/**
		Get the maximum usage across processes of trace buffer as a percentage of the full state. When the TraceBufferUsage value is determined the callback is called.
	**/
	static function getTraceBufferUsage(callback:haxe.Constraints.Function):Void;
}