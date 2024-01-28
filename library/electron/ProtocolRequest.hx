package electron;

/**
	

	See: <https://electronjs.org/docs/api/structures/protocol-request>
**/
@:require(js, hxelectron) typedef ProtocolRequest = {
	var url : String;
	var referrer : String;
	var method : String;
	var uploadData : Array<UploadData>;
	var headers : Record;
}