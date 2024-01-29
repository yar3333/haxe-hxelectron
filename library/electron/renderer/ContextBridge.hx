package electron.renderer;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "contextBridge") extern class ContextBridge {
	static function exposeInMainWorld(apiKey:String, api:Dynamic):Void;
	static function exposeInIsolatedWorld(worldId:Int, apiKey:String, api:Dynamic):Void;
}