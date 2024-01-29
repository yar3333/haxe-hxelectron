package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/shared-worker-info>
**/
@:require(js, hxelectron) typedef SharedWorkerInfo = {
	/**
		The unique id of the shared worker.
	**/
	var id : String;
	/**
		The url of the shared worker.
	**/
	var url : String;
}