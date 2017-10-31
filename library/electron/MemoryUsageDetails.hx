package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/memory-usage-details>
**/
@:require(js, hxelectron) typedef MemoryUsageDetails =
{
	var count : Float;
	var size : Float;
	var liveSize : Float;
}