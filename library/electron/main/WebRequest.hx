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
	function onBeforeRequest(?filter:WebRequestFilter, listener:Null<({ var id : Int; var url : String; var method : String; @:optional
	var webContentsId : Int; @:optional
	var webContents : WebContents; @:optional
	var frame : WebFrameMain; /**
		Can be `mainFrame`, `subFrame`, `stylesheet`, `script`, `image`, `font`, `object`, `xhr`, `ping`, `cspReport`, `media`, `webSocket` or `other`.
	**/
	var resourceType : String; var referrer : String; var timestamp : Float; var uploadData : Array<UploadData>; }, ({ @:optional
	var cancel : Bool; /**
		The original request is prevented from being sent or completed and is instead redirected to the given URL.
	**/
	@:optional
	var redirectURL : String; }) -> Dynamic) -> Dynamic>):Void;
	/**
		The `listener` will be called with `listener(details, callback)` before sending an HTTP request, once the request headers are available. This may occur after a TCP connection is made to the server, but before any http data is sent.
		
		The `callback` has to be called with a `response` object.
	**/
	function onBeforeSendHeaders(?filter:WebRequestFilter, listener:Null<({ var id : Int; var url : String; var method : String; @:optional
	var webContentsId : Int; @:optional
	var webContents : WebContents; @:optional
	var frame : WebFrameMain; /**
		Can be `mainFrame`, `subFrame`, `stylesheet`, `script`, `image`, `font`, `object`, `xhr`, `ping`, `cspReport`, `media`, `webSocket` or `other`.
	**/
	var resourceType : String; var referrer : String; var timestamp : Float; @:optional
	var uploadData : Array<UploadData>; var requestHeaders : Dynamic; }, ({ @:optional
	var cancel : Bool; /**
		When provided, request will be made with these headers.
	**/
	@:optional
	var requestHeaders : Dynamic; }) -> Dynamic) -> Dynamic>):Void;
	/**
		The `listener` will be called with `listener(details)` just before a request is going to be sent to the server, modifications of previous `onBeforeSendHeaders` response are visible by the time this listener is fired.
	**/
	function onSendHeaders(?filter:WebRequestFilter, listener:Null<({ var id : Int; var url : String; var method : String; @:optional
	var webContentsId : Int; @:optional
	var webContents : WebContents; @:optional
	var frame : WebFrameMain; /**
		Can be `mainFrame`, `subFrame`, `stylesheet`, `script`, `image`, `font`, `object`, `xhr`, `ping`, `cspReport`, `media`, `webSocket` or `other`.
	**/
	var resourceType : String; var referrer : String; var timestamp : Float; var requestHeaders : Dynamic; }) -> Dynamic>):Void;
	/**
		The `listener` will be called with `listener(details, callback)` when HTTP response headers of a request have been received.
		
		The `callback` has to be called with a `response` object.
	**/
	function onHeadersReceived(?filter:WebRequestFilter, listener:Null<({ var id : Int; var url : String; var method : String; @:optional
	var webContentsId : Int; @:optional
	var webContents : WebContents; @:optional
	var frame : WebFrameMain; /**
		Can be `mainFrame`, `subFrame`, `stylesheet`, `script`, `image`, `font`, `object`, `xhr`, `ping`, `cspReport`, `media`, `webSocket` or `other`.
	**/
	var resourceType : String; var referrer : String; var timestamp : Float; var statusLine : String; var statusCode : Int; @:optional
	var responseHeaders : Dynamic; }, ({ @:optional
	var cancel : Bool; /**
		When provided, the server is assumed to have responded with these headers.
	**/
	@:optional
	var responseHeaders : Dynamic; /**
		Should be provided when overriding `responseHeaders` to change header status otherwise original response header's status will be used.
	**/
	@:optional
	var statusLine : String; }) -> Dynamic) -> Dynamic>):Void;
	/**
		The `listener` will be called with `listener(details)` when first byte of the response body is received. For HTTP requests, this means that the status line and response headers are available.
	**/
	function onResponseStarted(?filter:WebRequestFilter, listener:Null<({ var id : Int; var url : String; var method : String; @:optional
	var webContentsId : Int; @:optional
	var webContents : WebContents; @:optional
	var frame : WebFrameMain; /**
		Can be `mainFrame`, `subFrame`, `stylesheet`, `script`, `image`, `font`, `object`, `xhr`, `ping`, `cspReport`, `media`, `webSocket` or `other`.
	**/
	var resourceType : String; var referrer : String; var timestamp : Float; @:optional
	var responseHeaders : Dynamic; /**
		Indicates whether the response was fetched from disk cache.
	**/
	var fromCache : Bool; var statusCode : Int; var statusLine : String; }) -> Dynamic>):Void;
	/**
		The `listener` will be called with `listener(details)` when a server initiated redirect is about to occur.
	**/
	function onBeforeRedirect(?filter:WebRequestFilter, listener:Null<({ var id : Int; var url : String; var method : String; @:optional
	var webContentsId : Int; @:optional
	var webContents : WebContents; @:optional
	var frame : WebFrameMain; /**
		Can be `mainFrame`, `subFrame`, `stylesheet`, `script`, `image`, `font`, `object`, `xhr`, `ping`, `cspReport`, `media`, `webSocket` or `other`.
	**/
	var resourceType : String; var referrer : String; var timestamp : Float; var redirectURL : String; var statusCode : Int; var statusLine : String; /**
		The server IP address that the request was actually sent to.
	**/
	@:optional
	var ip : String; var fromCache : Bool; @:optional
	var responseHeaders : Dynamic; }) -> Dynamic>):Void;
	/**
		The `listener` will be called with `listener(details)` when a request is completed.
	**/
	function onCompleted(?filter:WebRequestFilter, listener:Null<({ var id : Int; var url : String; var method : String; @:optional
	var webContentsId : Int; @:optional
	var webContents : WebContents; @:optional
	var frame : WebFrameMain; /**
		Can be `mainFrame`, `subFrame`, `stylesheet`, `script`, `image`, `font`, `object`, `xhr`, `ping`, `cspReport`, `media`, `webSocket` or `other`.
	**/
	var resourceType : String; var referrer : String; var timestamp : Float; @:optional
	var responseHeaders : Dynamic; var fromCache : Bool; var statusCode : Int; var statusLine : String; var error : String; }) -> Dynamic>):Void;
	/**
		The `listener` will be called with `listener(details)` when an error occurs.
	**/
	function onErrorOccurred(?filter:WebRequestFilter, listener:Null<({ var id : Int; var url : String; var method : String; @:optional
	var webContentsId : Int; @:optional
	var webContents : WebContents; @:optional
	var frame : WebFrameMain; /**
		Can be `mainFrame`, `subFrame`, `stylesheet`, `script`, `image`, `font`, `object`, `xhr`, `ping`, `cspReport`, `media`, `webSocket` or `other`.
	**/
	var resourceType : String; var referrer : String; var timestamp : Float; var fromCache : Bool; /**
		The error description.
	**/
	var error : String; }) -> Dynamic>):Void;
}

/**
**/
@:require(js, hxelectron) enum abstract WebRequestEvent(String) from String to String {

}