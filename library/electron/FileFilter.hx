package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/file-filter>
**/
@:require(js, hxelectron) typedef FileFilter = {
	var name : String;
	var extensions : Array<String>;
}