package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/notification-action>
**/
@:require(js, hxelectron) typedef NotificationAction = {
	/**
		The type of action, can be `button`.
	**/
	var type : String;
	/**
		The label for the given action.
	**/
	@:optional
	var text : String;
}