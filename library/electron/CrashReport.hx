package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/crash-report>
**/
@:require(js, hxelectron) typedef CrashReport = {
	var date : Date;
	var id : String;
}