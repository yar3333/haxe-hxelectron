package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/bluetooth-device>
**/
@:require(js, hxelectron) typedef BluetoothDevice =
{
	var deviceName : String;
	var deviceId : String;
}