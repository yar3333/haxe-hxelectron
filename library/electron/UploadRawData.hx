package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/upload-raw-data>
**/
@:require(js, hxelectron) typedef UploadRawData =
{
	/**
	 rawData.
	 */
	var type : String;
	/**
	 Data to be uploaded.
	 */
	var bytes : js.node.Buffer;
}