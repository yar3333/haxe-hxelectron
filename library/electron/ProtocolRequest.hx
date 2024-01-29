package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/protocol-request>
**/
@:require(js, hxelectron) typedef ProtocolRequest = {
	var url : String;
	var referrer : String;
	var method : String;
	@:optional
	var uploadData : Array<UploadData>;
	var headers : Dynamic;
}