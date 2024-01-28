package electron;

/**
	

	See: <https://electronjs.org/docs/api/structures/notification-response>
**/
@:require(js, hxelectron) typedef NotificationResponse = {
	/**
		The identifier string of the action that the user selected.
	**/
	var actionIdentifier : String;
	/**
		The delivery date of the notification.
	**/
	var date : Float;
	/**
		The unique identifier for this notification request.
	**/
	var identifier : String;
	/**
		A dictionary of custom information associated with the notification.
	**/
	var userInfo : Record;
	/**
		The text entered or chosen by the user.
	**/
	var userText : String;
}