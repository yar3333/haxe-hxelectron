package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/process-metric>
**/
@:require(js, hxelectron) typedef ProcessMetric = {
	/**
		Process id of the process.
	**/
	var pid : Int;
	/**
		Process type. One of the following values:
	**/
	var type : String;
	/**
		The non-localized name of the process.
	**/
	@:optional
	var serviceName : String;
	/**
		The name of the process. Examples for utility: `Audio Service`, `Content Decryption Module Service`, `Network Service`, `Video Capture`, etc.
	**/
	@:optional
	var name : String;
	/**
		CPU usage of the process.
	**/
	var cpu : CPUUsage;
	/**
		Creation time for this process. The time is represented as number of milliseconds since epoch. Since the `pid` can be reused after a process dies, it is useful to use both the `pid` and the `creationTime` to uniquely identify a process.
	**/
	var creationTime : Float;
	/**
		Memory information for the process.
	**/
	var memory : MemoryInfo;
	/**
		Whether the process is sandboxed on OS level.
	**/
	@:optional
	var sandboxed : Bool;
	/**
		One of the following values:
	**/
	@:optional
	var integrityLevel : String;
}