package electron;

/**
	

	See: <https://electronjs.org/docs/api/structures/upload-file>
**/
@:require(js, hxelectron) typedef UploadFile = {
	/**
		`file`.
	**/
	var type : 'file';
	/**
		Path of file to be uploaded.
	**/
	var filePath : String;
	/**
		Defaults to `0`.
	**/
	var offset : Int;
	/**
		Number of bytes to read from `offset`. Defaults to `0`.
	**/
	var length : Int;
	/**
		Last Modification time in number of seconds since the UNIX epoch. Defaults to `0`.
	**/
	var modificationTime : Float;
}