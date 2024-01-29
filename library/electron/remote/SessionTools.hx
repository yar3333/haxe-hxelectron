package electron.remote;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "remote.session") extern class SessionTools {
	/**
		A session instance from `partition` string. When there is an existing `Session` with the same `partition`, it will be returned; otherwise a new `Session` instance will be created with `options`.
		
		If `partition` starts with `persist:`, the page will use a persistent session available to all pages in the app with the same `partition`. if there is no `persist:` prefix, the page will use an in-memory session. If the `partition` is empty then default session of the app will be returned.
		
		To create a `Session` with `options`, you have to ensure the `Session` with the `partition` has never been used before. There is no way to change the `options` of an existing `Session` object.
	**/
	static function fromPartition(partition:String, ?options:{ /**
		Whether to enable cache.
	**/
	var cache : Bool; }):Session;
	/**
		A session instance from the absolute path as specified by the `path` string. When there is an existing `Session` with the same absolute path, it will be returned; otherwise a new `Session` instance will be created with `options`. The call will throw an error if the path is not an absolute path. Additionally, an error will be thrown if an empty string is provided.
		
		To create a `Session` with `options`, you have to ensure the `Session` with the `path` has never been used before. There is no way to change the `options` of an existing `Session` object.
	**/
	static function fromPath(path:String, ?options:{ /**
		Whether to enable cache.
	**/
	var cache : Bool; }):Session;
}