package electron.remote;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "remote.desktopCapturer") extern class DesktopCapturer {
	/**
		Resolves with an array of `DesktopCapturerSource` objects, each `DesktopCapturerSource` represents a screen or an individual window that can be captured.
		
		**Note** Capturing the screen contents requires user consent on macOS 10.15 Catalina or higher, which can detected by `systemPreferences.getMediaAccessStatus`.
	**/
	static function getSources(options:{ /**
		An array of strings that lists the types of desktop sources to be captured, available types can be `screen` and `window`.
	**/
	var types : Array<String>; /**
		The size that the media source thumbnail should be scaled to. Default is `150` x `150`. Set width or height to 0 when you do not need the thumbnails. This will save the processing time required for capturing the content of each window and screen.
	**/
	@:optional
	var thumbnailSize : Size; /**
		Set to true to enable fetching window icons. The default value is false. When false the appIcon property of the sources return null. Same if a source has the type screen.
	**/
	@:optional
	var fetchWindowIcons : Bool; }):js.lib.Promise<Array<DesktopCapturerSource>>;
}