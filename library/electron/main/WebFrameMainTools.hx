package electron.main;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "webFrameMain") extern class WebFrameMainTools {
	/**
		A frame with the given process and routing IDs, or `undefined` if there is no WebFrameMain associated with the given IDs.
	**/
	static function fromId(processId:Int, routingId:Int):Null<WebFrameMain>;
}