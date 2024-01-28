package electron.remote;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "remote.globalShortcut") extern class GlobalShortcut {
	/**
		Whether or not the shortcut was registered successfully.
		
		Registers a global shortcut of `accelerator`. The `callback` is called when the registered shortcut is pressed by the user.
		
		When the accelerator is already taken by other applications, this call will silently fail. This behavior is intended by operating systems, since they don't want applications to fight for global shortcuts.
		
		The following accelerators will not be registered successfully on macOS 10.14 Mojave unless the app has been authorized as a trusted accessibility client:
		
		* "Media Play/Pause"
		* "Media Next Track"
		* "Media Previous Track"
		* "Media Stop"
	**/
	static function register(accelerator:Accelerator, callback:haxe.Constraints.Function):Bool;
	/**
		Registers a global shortcut of all `accelerator` items in `accelerators`. The `callback` is called when any of the registered shortcuts are pressed by the user.
		
		When a given accelerator is already taken by other applications, this call will silently fail. This behavior is intended by operating systems, since they don't want applications to fight for global shortcuts.
		
		The following accelerators will not be registered successfully on macOS 10.14 Mojave unless the app has been authorized as a trusted accessibility client:
		
		* "Media Play/Pause"
		* "Media Next Track"
		* "Media Previous Track"
		* "Media Stop"
	**/
	static function registerAll(accelerators:Array<Accelerator>, callback:haxe.Constraints.Function):Void;
	/**
		Whether this application has registered `accelerator`.
		
		When the accelerator is already taken by other applications, this call will still return `false`. This behavior is intended by operating systems, since they don't want applications to fight for global shortcuts.
	**/
	static function isRegistered(accelerator:Accelerator):Bool;
	/**
		Unregisters the global shortcut of `accelerator`.
	**/
	static function unregister(accelerator:Accelerator):Void;
	/**
		Unregisters all of the global shortcuts.
	**/
	static function unregisterAll():Void;
}