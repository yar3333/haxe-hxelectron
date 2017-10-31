package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/upload-blob>
**/
@:require(js, electron) typedef UploadBlob = {
	/**
		blob.
	**/
	var type : String;
	/**
		UUID of blob data to upload.
	**/
	var blobUUID : String;
}