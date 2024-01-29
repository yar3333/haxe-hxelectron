package electron;

import electron.main.*;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "parentPort") extern class ParentPort {
	/**
		Sends a message from the process to its parent.
	**/
	static function postMessage(message:Dynamic):Void;
}