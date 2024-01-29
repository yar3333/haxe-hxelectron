package electron;

import electron.main.*;

/**
	The `flags` is an array that can include following `string`s:

* `enabled` - The button is active and available to the user.
* `disabled` - The button is disabled. It is present, but has a visual state indicating it will not respond to user action.
* `dismissonclick` - When the button is clicked, the thumbnail window closes immediately.
* `nobackground` - Do not draw a button border, use only the image.
* `hidden` - The button is not shown to the user.
* `noninteractive` - The button is enabled but not interactive; no pressed button state is drawn. This value is intended for instances where the button is used in a notification.

	See: <https://electronjs.org/docs/api/structures/thumbar-button>
**/
@:require(js, hxelectron) typedef ThumbarButton = {
	/**
		The icon showing in thumbnail toolbar.
	**/
	var icon : NativeImage;
	var click : () -> Dynamic;
	/**
		The text of the button's tooltip.
	**/
	@:optional
	var tooltip : String;
	/**
		Control specific states and behaviors of the button. By default, it is `['enabled']`.
	**/
	@:optional
	var flags : Array<String>;
}