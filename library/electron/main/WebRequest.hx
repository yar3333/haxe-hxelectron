package electron.main;

/**
	

	See: <https://electronjs.org/docs/api/web-request>
**/
@:require(js, hxelectron) @:jsRequire("electron", "WebRequest") extern class WebRequest extends js.node.events.EventEmitter<electron.main.WebRequest> {
	/**
		The `listener` will be called with `listener(details, callback)` when a request is about to occur.
		
		The `uploadData` is an array of `UploadData` objects.
		
		The `callback` has to be called with an `response` object.
		
		Some examples of valid `urls`:
	**/
	function onBeforeRequest(?filter:WebRequestFilter, listener:Dynamic):Void;
	/**
		The `listener` will be called with `listener(details, callback)` before sending an HTTP request, once the request headers are available. This may occur after a TCP connection is made to the server, but before any http data is sent.
		
		The `callback` has to be called with a `response` object.
	**/
	function onBeforeSendHeaders(?filter:WebRequestFilter, listener:Dynamic):Void;
	/**
		The `listener` will be called with `listener(details)` just before a request is going to be sent to the server, modifications of previous `onBeforeSendHeaders` response are visible by the time this listener is fired.
	**/
	function onSendHeaders(?filter:WebRequestFilter, listener:Dynamic):Void;
	/**
		The `listener` will be called with `listener(details, callback)` when HTTP response headers of a request have been received.
		
		The `callback` has to be called with a `response` object.
	**/
	function onHeadersReceived(?filter:WebRequestFilter, listener:Dynamic):Void;
	/**
		The `listener` will be called with `listener(details)` when first byte of the response body is received. For HTTP requests, this means that the status line and response headers are available.
	**/
	function onResponseStarted(?filter:WebRequestFilter, listener:Dynamic):Void;
	/**
		The `listener` will be called with `listener(details)` when a server initiated redirect is about to occur.
	**/
	function onBeforeRedirect(?filter:WebRequestFilter, listener:Dynamic):Void;
	/**
		The `listener` will be called with `listener(details)` when a request is completed.
	**/
	function onCompleted(?filter:WebRequestFilter, listener:Dynamic):Void;
	/**
		The `listener` will be called with `listener(details)` when an error occurs.
	**/
	function onErrorOccurred(?filter:WebRequestFilter, listener:Dynamic):Void;
}

/**
**/
@:require(js, hxelectron) enum abstract WebRequestEvent(String) from String to String {

}