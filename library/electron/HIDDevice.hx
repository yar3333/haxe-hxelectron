package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/hid-device>
**/
@:require(js, hxelectron) typedef HIDDevice = {
	/**
		Unique identifier for the device.
	**/
	var deviceId : String;
	/**
		Name of the device.
	**/
	var name : String;
	/**
		The USB vendor ID.
	**/
	var vendorId : Int;
	/**
		The USB product ID.
	**/
	var productId : Int;
	/**
		The USB device serial number.
	**/
	@:optional
	var serialNumber : String;
	/**
		Unique identifier for the HID interface.  A device may have multiple HID interfaces.
	**/
	@:optional
	var guid : String;
}