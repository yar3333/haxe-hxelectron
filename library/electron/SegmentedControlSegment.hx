package electron;

/**
	

	See: <https://electronjs.org/docs/api/structures/segmented-control-segment>
**/
@:require(js, hxelectron) typedef SegmentedControlSegment = {
	/**
		The text to appear in this segment.
	**/
	var label : String;
	/**
		The image to appear in this segment.
	**/
	var icon : NativeImage;
	/**
		Whether this segment is selectable. Default: true.
	**/
	var enabled : Bool;
}