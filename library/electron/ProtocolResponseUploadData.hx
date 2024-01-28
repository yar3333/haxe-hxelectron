package electron;

/**
	

	See: <https://electronjs.org/docs/api/structures/protocol-response-upload-data>
**/
@:require(js, hxelectron) typedef ProtocolResponseUploadData = {
	/**
		MIME type of the content.
	**/
	var contentType : String;
	/**
		Content to be sent.
	**/
	var data : Dynamic;
}