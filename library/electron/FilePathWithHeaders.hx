package electron;

/**
	

	See: <https://electronjs.org/docs/api/structures/file-path-with-headers>
**/
@:require(js, hxelectron) typedef FilePathWithHeaders = {
	/**
		The path to the file to send.
	**/
	var path : String;
	/**
		Additional headers to be sent.
	**/
	var headers : Record;
}