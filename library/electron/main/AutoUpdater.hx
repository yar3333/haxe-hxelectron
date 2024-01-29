package electron.main;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "autoUpdater") extern class AutoUpdater {
	/**
		Sets the `url` and initialize the auto updater.
	**/
	static function setFeedURL(options:{ var url : String; /**
		HTTP request headers.
	**/
	@:optional
	var headers : Dynamic; /**
		Can be `json` or `default`, see the Squirrel.Mac README for more information.
	**/
	@:optional
	var serverType : String; }):Void;
	/**
		The current update feed URL.
	**/
	static function getFeedURL():String;
	/**
		Asks the server whether there is an update. You must call `setFeedURL` before using this API.
		
		**Note:** If an update is available it will be downloaded automatically. Calling `autoUpdater.checkForUpdates()` twice will download the update two times.
	**/
	static function checkForUpdates():Void;
	/**
		Restarts the app and installs the update after it has been downloaded. It should only be called after `update-downloaded` has been emitted.
		
		Under the hood calling `autoUpdater.quitAndInstall()` will close all application windows first, and automatically call `app.quit()` after all windows have been closed.
		
		**Note:** It is not strictly necessary to call this function to apply an update, as a successfully downloaded update will always be applied the next time the application starts.
	**/
	static function quitAndInstall():Void;
}