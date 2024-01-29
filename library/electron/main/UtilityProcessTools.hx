package electron.main;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "utilityProcess") extern class UtilityProcessTools {
	static function fork(modulePath:String, ?args:Array<String>, ?options:{ /**
		Environment key-value pairs. Default is `process.env`.
	**/
	@:optional
	var env : { }; /**
		List of string arguments passed to the executable.
	**/
	@:optional
	var execArgv : Array<String>; /**
		Current working directory of the child process.
	**/
	@:optional
	var cwd : String; /**
		Allows configuring the mode for `stdout` and `stderr` of the child process. Default is `inherit`. String value can be one of `pipe`, `ignore`, `inherit`, for more details on these values you can refer to stdio documentation from Node.js. Currently this option only supports configuring `stdout` and `stderr` to either `pipe`, `inherit` or `ignore`. Configuring `stdin` is not supported; `stdin` will always be ignored. For example, the supported values will be processed as following:
	**/
	@:optional
	var stdio : haxe.extern.EitherType<Array<String>, String>; /**
		Name of the process that will appear in `name` property of `ProcessMetric` returned by `app.getAppMetrics` and `child-process-gone` event of `app`. Default is `Node Utility Process`.
	**/
	@:optional
	var serviceName : String; /**
		With this flag, the utility process will be launched via the `Electron Helper (Plugin).app` helper executable on macOS, which can be codesigned with `com.apple.security.cs.disable-library-validation` and `com.apple.security.cs.allow-unsigned-executable-memory` entitlements. This will allow the utility process to load unsigned libraries. Unless you specifically need this capability, it is best to leave this disabled. Default is `false`.
	**/
	@:optional
	var allowLoadingUnsignedLibraries : Bool; }):UtilityProcess;
}