package electron.remote;

/**
	

	See: <https://electronjs.org/docs/api/dock>
**/
@:require(js, hxelectron) @:jsRequire("electron", "remote.Dock") extern class Dock extends js.node.events.EventEmitter<electron.main.Dock> {
	/**
		an ID representing the request.
		
		When `critical` is passed, the dock icon will bounce until either the application becomes active or the request is canceled.
		
		When `informational` is passed, the dock icon will bounce for one second. However, the request remains active until either the application becomes active or the request is canceled.
		
		**Note:** This method can only be used while the app is not focused; when the app is focused it will return -1.
	**/
	function bounce(?type:String):Int;
	/**
		Cancel the bounce of `id`.
	**/
	function cancelBounce(id:Int):Void;
	/**
		Bounces the Downloads stack if the filePath is inside the Downloads folder.
	**/
	function downloadFinished(filePath:String):Void;
	/**
		Sets the string to be displayed in the dock’s badging area.
	**/
	function setBadge(text:String):Void;
	/**
		The badge string of the dock.
	**/
	function getBadge():String;
	/**
		Hides the dock icon.
	**/
	function hide():Void;
	/**
		Resolves when the dock icon is shown.
	**/
	function show():js.lib.Promise<Void>;
	/**
		Whether the dock icon is visible.
	**/
	function isVisible():Bool;
	/**
		Sets the application's dock menu.
	**/
	function setMenu(menu:Menu):Void;
	/**
		The application's dock menu.
	**/
	function getMenu():Null<Menu>;
	/**
		Sets the `image` associated with this dock icon.
	**/
	function setIcon(image:haxe.extern.EitherType<NativeImage, String>):Void;
}

/**
**/
@:require(js, hxelectron) enum abstract DockEvent(String) from String to String {

}