package electron.main;

/**
	> Create a segmented control (a button group) where one button has a selected state

Process: Main<br /> _This class is not exported from the `'electron'` module. It is only available as a return value of other methods in the Electron API._

	See: <https://electronjs.org/docs/api/touch-bar-segmented-control>
**/
@:require(js, hxelectron) @:jsRequire("electron", "TouchBarSegmentedControl") extern class TouchBarSegmentedControl extends js.node.events.EventEmitter<electron.main.TouchBarSegmentedControl> {
	/**
		A `string` representing the controls current segment style. Updating this value immediately updates the control in the touch bar.
	**/
	var segmentStyle : String;
	/**
		A `SegmentedControlSegment[]` array representing the segments in this control. Updating this value immediately updates the control in the touch bar. Updating deep properties inside this array **does not update the touch bar**.
	**/
	var segments : Array<SegmentedControlSegment>;
	/**
		An `Integer` representing the currently selected segment. Changing this value immediately updates the control in the touch bar. User interaction with the touch bar will update this value automatically.
	**/
	var selectedIndex : Int;
	/**
		A `string` representing the current selection mode of the control.  Can be `single`, `multiple` or `buttons`.
	**/
	var mode : String;
	function new(options:{ /**
		Style of the segments:
	**/
	@:optional
	var segmentStyle : String; /**
		The selection mode of the control:
	**/
	@:optional
	var mode : String; /**
		An array of segments to place in this control.
	**/
	var segments : Array<SegmentedControlSegment>; /**
		The index of the currently selected segment, will update automatically with user interaction. When the mode is `multiple` it will be the last selected item.
	**/
	@:optional
	var selectedIndex : Int; /**
		Called when the user selects a new segment.
	**/
	@:optional
	var change : (Int, Bool) -> Dynamic; }):Void;
}

/**
**/
@:require(js, hxelectron) enum abstract TouchBarSegmentedControlEvent(String) from String to String {

}