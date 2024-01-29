package electron.main;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "webContents") extern class WebContentsTools {
	/**
		An array of all `WebContents` instances. This will contain web contents for all windows, webviews, opened devtools, and devtools extension background pages.
	**/
	static function getAllWebContents():Array<WebContents>;
	/**
		The web contents that is focused in this application, otherwise returns `null`.
	**/
	static function getFocusedWebContents():Null<WebContents>;
	/**
		A WebContents instance with the given ID, or `undefined` if there is no WebContents associated with the given ID.
	**/
	static function fromId(id:Int):Null<WebContents>;
	/**
		A WebContents instance with the given WebFrameMain, or `undefined` if there is no WebContents associated with the given WebFrameMain.
	**/
	static function fromFrame(frame:WebFrameMain):Null<WebContents>;
	/**
		A WebContents instance with the given TargetID, or `undefined` if there is no WebContents associated with the given TargetID.
		
		When communicating with the Chrome DevTools Protocol, it can be useful to lookup a WebContents instance based on its assigned TargetID.
	**/
	static function fromDevToolsTargetId(targetId:String):Null<WebContents>;
}