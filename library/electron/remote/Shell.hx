package electron.remote;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "remote.shell") extern class Shell {
	/**
		Show the given file in a file manager. If possible, select the file.
	**/
	static function showItemInFolder(fullPath:String):Void;
	/**
		Resolves with a string containing the error message corresponding to the failure if a failure occurred, otherwise "".
		
		Open the given file in the desktop's default manner.
	**/
	static function openPath(path:String):js.lib.Promise<String>;
	/**
		Open the given external protocol URL in the desktop's default manner. (For example, mailto: URLs in the user's default mail agent).
	**/
	static function openExternal(url:String, ?options:{ /**
		`true` to bring the opened application to the foreground. The default is `true`.
	**/
	@:optional
	var activate : Bool; /**
		The working directory.
	**/
	@:optional
	var workingDirectory : String; /**
		Indicates a user initiated launch that enables tracking of frequently used programs and other behaviors. The default is `false`.
	**/
	@:optional
	var logUsage : Bool; }):js.lib.Promise<Void>;
	/**
		Resolves when the operation has been completed. Rejects if there was an error while deleting the requested item.
		
		This moves a path to the OS-specific trash location (Trash on macOS, Recycle Bin on Windows, and a desktop-environment-specific location on Linux).
	**/
	static function trashItem(path:String):js.lib.Promise<Void>;
	/**
		Play the beep sound.
	**/
	static function beep():Void;
	/**
		Whether the shortcut was created successfully.
		
		Creates or updates a shortcut link at `shortcutPath`.
	**/
	static function writeShortcutLink(shortcutPath:String, ?operation:String, options:ShortcutDetails):Bool;
	/**
		Resolves the shortcut link at `shortcutPath`.
		
		An exception will be thrown when any error happens.
	**/
	static function readShortcutLink(shortcutPath:String):ShortcutDetails;
}