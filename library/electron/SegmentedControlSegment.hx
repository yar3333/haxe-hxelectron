package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/segmented-control-segment>
**/
@:require(js, hxelectron) typedef SegmentedControlSegment = {
	/**
		The text to appear in this segment.
	**/
	@:optional
	var label : String;
	/**
		The image to appear in this segment.
	**/
	@:optional
	var icon : NativeImage;
	/**
		Whether this segment is selectable. Default: true.
	**/
	@:optional
	var enabled : Bool;
}