package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/bluetooth-device>
**/
@:require(js, hxelectron) typedef BluetoothDevice = {
	var deviceName : String;
	var deviceId : String;
}