package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/sharing-item>
**/
@:require(js, hxelectron) typedef SharingItem = {
	/**
		An array of text to share.
	**/
	@:optional
	var texts : Array<String>;
	/**
		An array of files to share.
	**/
	@:optional
	var filePaths : Array<String>;
	/**
		An array of URLs to share.
	**/
	@:optional
	var urls : Array<String>;
}