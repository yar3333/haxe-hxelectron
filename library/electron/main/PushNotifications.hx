package electron.main;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "pushNotifications") extern class PushNotifications {
	/**
		Registers the app with Apple Push Notification service (APNS) to receive Badge, Sound, and Alert notifications. If registration is successful, the promise will be resolved with the APNS device token. Otherwise, the promise will be rejected with an error message. See: https://developer.apple.com/documentation/appkit/nsapplication/1428476-registerforremotenotificationtyp?language=objc
	**/
	static function registerForAPNSNotifications():js.lib.Promise<String>;
	/**
		Unregisters the app from notifications received from APNS. See: https://developer.apple.com/documentation/appkit/nsapplication/1428747-unregisterforremotenotifications?language=objc
	**/
	static function unregisterForAPNSNotifications():Void;
}