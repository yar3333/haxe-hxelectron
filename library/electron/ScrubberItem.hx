package electron;

/**
	

	See: <https://electronjs.org/docs/api/structures/scrubber-item>
**/
@:require(js, hxelectron) typedef ScrubberItem = {
	/**
		The text to appear in this item.
	**/
	var label : String;
	/**
		The image to appear in this item.
	**/
	var icon : NativeImage;
}