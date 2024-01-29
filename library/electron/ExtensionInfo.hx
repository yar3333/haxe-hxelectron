package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/extension-info>
**/
@:require(js, hxelectron) typedef ExtensionInfo = {
	var name : String;
	var version : String;
}