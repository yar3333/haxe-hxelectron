package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/upload-raw-data>
**/
@:require(js, hxelectron) typedef UploadRawData = {
	/**
		`rawData`.
	**/
	var type : String;
	/**
		Data to be uploaded.
	**/
	var bytes : js.node.Buffer;
}