package electron;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "crashReporter") extern class CrashReporter {
	/**
		This method must be called before using any other `crashReporter` APIs. Once initialized this way, the crashpad handler collects crashes from all subsequently created processes. The crash reporter cannot be disabled once started.
		
		This method should be called as early as possible in app startup, preferably before `app.on('ready')`. If the crash reporter is not initialized at the time a renderer process is created, then that renderer process will not be monitored by the crash reporter.
		
		**Note:** You can test out the crash reporter by generating a crash using `process.crash()`.
		
		**Note:** If you need to send additional/updated `extra` parameters after your first call `start` you can call `addExtraParameter`.
		
		**Note:** Parameters passed in `extra`, `globalExtra` or set with `addExtraParameter` have limits on the length of the keys and values. Key names must be at most 39 bytes long, and values must be no longer than 127 bytes. Keys with names longer than the maximum will be silently ignored. Key values longer than the maximum length will be truncated.
		
		**Note:** This method is only available in the main process.
	**/
	static function start(options:{ /**
		URL that crash reports will be sent to as POST. Required unless `uploadToServer` is `false`.
	**/
	@:optional
	var submitURL : String; /**
		Defaults to `app.name`.
	**/
	@:optional
	var productName : String; /**
		Deprecated alias for `{ globalExtra: { _companyName: ... } }`.
	**/
	@:optional
	var companyName : String; /**
		Whether crash reports should be sent to the server. If false, crash reports will be collected and stored in the crashes directory, but not uploaded. Default is `true`.
	**/
	@:optional
	var uploadToServer : Bool; /**
		If true, crashes generated in the main process will not be forwarded to the system crash handler. Default is `false`.
	**/
	@:optional
	var ignoreSystemCrashHandler : Bool; /**
		If true, limit the number of crashes uploaded to 1/hour. Default is `false`.
	**/
	@:optional
	var rateLimit : Bool; /**
		If true, crash reports will be compressed and uploaded with `Content-Encoding: gzip`. Default is `true`.
	**/
	@:optional
	var compress : Bool; /**
		Extra string key/value annotations that will be sent along with crash reports that are generated in the main process. Only string values are supported. Crashes generated in child processes will not contain these extra parameters to crash reports generated from child processes, call `addExtraParameter` from the child process.
	**/
	@:optional
	var extra : Record; /**
		Extra string key/value annotations that will be sent along with any crash reports generated in any process. These annotations cannot be changed once the crash reporter has been started. If a key is present in both the global extra parameters and the process-specific extra parameters, then the global one will take precedence. By default, `productName` and the app version are included, as well as the Electron version.
	**/
	@:optional
	var globalExtra : Record; }):Void;
	/**
		The date and ID of the last crash report. Only crash reports that have been uploaded will be returned; even if a crash report is present on disk it will not be returned until it is uploaded. In the case that there are no uploaded reports, `null` is returned.
		
		**Note:** This method is only available in the main process.
	**/
	static function getLastCrashReport():CrashReport;
	/**
		Returns all uploaded crash reports. Each report contains the date and uploaded ID.
		
		**Note:** This method is only available in the main process.
	**/
	static function getUploadedReports():Array<CrashReport>;
	/**
		Whether reports should be submitted to the server. Set through the `start` method or `setUploadToServer`.
		
		**Note:** This method is only available in the main process.
	**/
	static function getUploadToServer():Bool;
	/**
		This would normally be controlled by user preferences. This has no effect if called before `start` is called.
		
		**Note:** This method is only available in the main process.
	**/
	static function setUploadToServer(uploadToServer:Bool):Void;
	/**
		Set an extra parameter to be sent with the crash report. The values specified here will be sent in addition to any values set via the `extra` option when `start` was called.
		
		Parameters added in this fashion (or via the `extra` parameter to `crashReporter.start`) are specific to the calling process. Adding extra parameters in the main process will not cause those parameters to be sent along with crashes from renderer or other child processes. Similarly, adding extra parameters in a renderer process will not result in those parameters being sent with crashes that occur in other renderer processes or in the main process.
		
		**Note:** Parameters have limits on the length of the keys and values. Key names must be no longer than 39 bytes, and values must be no longer than 20320 bytes. Keys with names longer than the maximum will be silently ignored. Key values longer than the maximum length will be truncated.
	**/
	static function addExtraParameter(key:String, value:String):Void;
	/**
		Remove an extra parameter from the current set of parameters. Future crashes will not include this parameter.
	**/
	static function removeExtraParameter(key:String):Void;
	/**
		The current 'extra' parameters of the crash reporter.
	**/
	static function getParameters():Record;
}