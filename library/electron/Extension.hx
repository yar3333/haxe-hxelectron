package electron;

/**
	

	See: <https://electronjs.org/docs/api/structures/extension>
**/
@:require(js, hxelectron) typedef Extension = {
	var id : String;
	/**
		Copy of the extension's manifest data.
	**/
	var manifest : Any;
	var name : String;
	/**
		The extension's file path.
	**/
	var path : String;
	var version : String;
	/**
		The extension's `chrome-extension://` URL.
	**/
	var url : String;
}