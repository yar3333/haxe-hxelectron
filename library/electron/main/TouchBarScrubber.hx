package electron.main;

/**
	> Create a scrubber (a scrollable selector)

Process: Main<br /> _This class is not exported from the `'electron'` module. It is only available as a return value of other methods in the Electron API._

	See: <https://electronjs.org/docs/api/touch-bar-scrubber>
**/
@:require(js, hxelectron) @:jsRequire("electron", "TouchBarScrubber") extern class TouchBarScrubber extends js.node.events.EventEmitter<electron.main.TouchBarScrubber> {
	/**
		A `ScrubberItem[]` array representing the items in this scrubber. Updating this value immediately updates the control in the touch bar. Updating deep properties inside this array **does not update the touch bar**.
	**/
	var items : ScrubberItem;
	/**
		A `string` representing the style that selected items in the scrubber should have. Updating this value immediately updates the control in the touch bar. Possible values:
		
		* `background` - Maps to `[NSScrubberSelectionStyle roundedBackgroundStyle]`.
		* `outline` - Maps to `[NSScrubberSelectionStyle outlineOverlayStyle]`.
		* `none` - Removes all styles.
	**/
	var selectedStyle : String;
	/**
		A `string` representing the style that selected items in the scrubber should have. This style is overlayed on top of the scrubber item instead of being placed behind it. Updating this value immediately updates the control in the touch bar. Possible values:
		
		* `background` - Maps to `[NSScrubberSelectionStyle roundedBackgroundStyle]`.
		* `outline` - Maps to `[NSScrubberSelectionStyle outlineOverlayStyle]`.
		* `none` - Removes all styles.
	**/
	var overlayStyle : String;
	/**
		A `boolean` representing whether to show the left / right selection arrows in this scrubber. Updating this value immediately updates the control in the touch bar.
	**/
	var showArrowButtons : Bool;
	/**
		A `string` representing the mode of this scrubber. Updating this value immediately updates the control in the touch bar. Possible values:
		
		* `fixed` - Maps to `NSScrubberModeFixed`.
		* `free` - Maps to `NSScrubberModeFree`.
	**/
	var mode : String;
	/**
		A `boolean` representing whether this scrubber is continuous or not. Updating this value immediately updates the control in the touch bar.
	**/
	var continuous : Bool;
	function new(options:{ /**
		An array of items to place in this scrubber.
	**/
	@:optional
	var items : Array<ScrubberItem>; /**
		Called when the user taps an item that was not the last tapped item.
	**/
	@:optional
	var select : haxe.Constraints.Function; /**
		Called when the user taps any item.
	**/
	@:optional
	var highlight : haxe.Constraints.Function; /**
		Selected item style. Can be `background`, `outline` or `none`. Defaults to `none`.
	**/
	@:optional
	var selectedStyle : String; /**
		Selected overlay item style. Can be `background`, `outline` or `none`. Defaults to `none`.
	**/
	@:optional
	var overlayStyle : String; /**
		Whether to show arrow buttons. Defaults to `false` and is only shown if `items` is non-empty.
	**/
	@:optional
	var showArrowButtons : Bool; /**
		Can be `fixed` or `free`. The default is `free`.
	**/
	@:optional
	var mode : String; /**
		Defaults to `true`.
	**/
	@:optional
	var continuous : Bool; }):Void;
}

/**
**/
@:require(js, hxelectron) enum abstract TouchBarScrubberEvent(String) from String to String {

}