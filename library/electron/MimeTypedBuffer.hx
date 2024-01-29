package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/mime-typed-buffer>
**/
@:require(js, hxelectron) typedef MimeTypedBuffer = {
	/**
		MIME type of the buffer.
	**/
	@:optional
	var mimeType : String;
	/**
		Charset of the buffer.
	**/
	@:optional
	var charset : String;
	/**
		The actual Buffer content.
	**/
	var data : js.node.Buffer;
}