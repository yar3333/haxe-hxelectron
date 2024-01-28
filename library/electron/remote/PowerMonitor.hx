package electron.remote;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "remote.powerMonitor") extern class PowerMonitor {
	/**
		The system's current idle state. Can be `active`, `idle`, `locked` or `unknown`.
		
		Calculate the system idle state. `idleThreshold` is the amount of time (in seconds) before considered idle.  `locked` is available on supported systems only.
	**/
	static function getSystemIdleState(idleThreshold:Int):String;
	/**
		Idle time in seconds
		
		Calculate system idle time in seconds.
	**/
	static function getSystemIdleTime():Int;
	/**
		The system's current thermal state. Can be `unknown`, `nominal`, `fair`, `serious`, or `critical`.
	**/
	static function getCurrentThermalState():String;
	/**
		Whether the system is on battery power.
		
		To monitor for changes in this property, use the `on-battery` and `on-ac` events.
	**/
	static function isOnBatteryPower():Bool;
}