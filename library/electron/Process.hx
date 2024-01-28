package electron;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "process") extern class Process {
	/**
		Causes the main thread of the current process crash.
	**/
	static function crash():Void;
	/**
		The number of milliseconds since epoch, or `null` if the information is unavailable
		
		Indicates the creation time of the application. The time is represented as number of milliseconds since epoch. It returns null if it is unable to get the process creation time.
	**/
	static function getCreationTime():Dynamic;
	static function getCPUUsage():CPUUsage;
	static function getIOCounters():IOCounters;
	/**
		* `totalHeapSize` Integer
		* `totalHeapSizeExecutable` Integer
		* `totalPhysicalSize` Integer
		* `totalAvailableSize` Integer
		* `usedHeapSize` Integer
		* `heapSizeLimit` Integer
		* `mallocedMemory` Integer
		* `peakMallocedMemory` Integer
		* `doesZapGarbage` boolean
		
		Returns an object with V8 heap statistics. Note that all statistics are reported in Kilobytes.
	**/
	static function getHeapStatistics():{ @:optional
	var totalHeapSize : Int; @:optional
	var totalHeapSizeExecutable : Int; @:optional
	var totalPhysicalSize : Int; @:optional
	var totalAvailableSize : Int; @:optional
	var usedHeapSize : Int; @:optional
	var heapSizeLimit : Int; @:optional
	var mallocedMemory : Int; @:optional
	var peakMallocedMemory : Int; @:optional
	var doesZapGarbage : Bool; };
	/**
		* `allocated` Integer - Size of all allocated objects in Kilobytes.
		* `total` Integer - Total allocated space in Kilobytes.
		
		Returns an object with Blink memory information. It can be useful for debugging rendering / DOM related memory issues. Note that all values are reported in Kilobytes.
	**/
	static function getBlinkMemoryInfo():{ /**
		Size of all allocated objects in Kilobytes.
	**/
	@:optional
	var allocated : Int; /**
		Total allocated space in Kilobytes.
	**/
	@:optional
	var total : Int; };
	/**
		Resolves with a ProcessMemoryInfo
		
		Returns an object giving memory usage statistics about the current process. Note that all statistics are reported in Kilobytes. This api should be called after app ready.
		
		Chromium does not provide `residentSet` value for macOS. This is because macOS performs in-memory compression of pages that haven't been recently used. As a result the resident set size value is not what one would expect. `private` memory is more representative of the actual pre-compression memory usage of the process on macOS.
	**/
	static function getProcessMemoryInfo():js.lib.Promise<Dynamic>;
	/**
		* `total` Integer - The total amount of physical memory in Kilobytes available to the system.
		* `free` Integer - The total amount of memory not being used by applications or disk cache.
		* `swapTotal` Integer _Windows_ _Linux_ - The total amount of swap memory in Kilobytes available to the system.
		* `swapFree` Integer _Windows_ _Linux_ - The free amount of swap memory in Kilobytes available to the system.
		
		Returns an object giving memory usage statistics about the entire system. Note that all statistics are reported in Kilobytes.
	**/
	static function getSystemMemoryInfo():{ /**
		The total amount of physical memory in Kilobytes available to the system.
	**/
	@:optional
	var total : Int; /**
		The total amount of memory not being used by applications or disk cache.
	**/
	@:optional
	var free : Int; /**
		The total amount of swap memory in Kilobytes available to the system.
	**/
	@:optional
	var swapTotal : Int; /**
		The free amount of swap memory in Kilobytes available to the system.
	**/
	@:optional
	var swapFree : Int; };
	/**
		The version of the host operating system.
		
		Example:
		
		**Note:** It returns the actual operating system version instead of kernel version on macOS unlike `os.release()`.
	**/
	static function getSystemVersion():String;
	/**
		Indicates whether the snapshot has been created successfully.
		
		Takes a V8 heap snapshot and saves it to `filePath`.
	**/
	static function takeHeapSnapshot(filePath:String):Bool;
	/**
		Causes the main thread of the current process hang.
	**/
	static function hang():Void;
	/**
		Sets the file descriptor soft limit to `maxDescriptors` or the OS hard limit, whichever is lower for the current process.
	**/
	static function setFdLimit(maxDescriptors:Int):Void;
}