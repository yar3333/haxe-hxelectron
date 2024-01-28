package electron;

/**
	

	See: <https://electronjs.org/docs/api/structures/process-memory-info>
**/
@:require(js, hxelectron) typedef ProcessMemoryInfo = {
	/**
		The amount of memory currently pinned to actual physical RAM in Kilobytes.
	**/
	var residentSet : Int;
	/**
		The amount of memory not shared by other processes, such as JS heap or HTML content in Kilobytes.
	**/
	var private : Int;
	/**
		The amount of memory shared between processes, typically memory consumed by the Electron code itself in Kilobytes.
	**/
	var shared : Int;
}