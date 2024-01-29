package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/web-source>
**/
@:require(js, hxelectron) typedef WebSource = {
	var code : String;
	@:optional
	var url : String;
}