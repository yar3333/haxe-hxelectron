package electron.main;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "safeStorage") extern class SafeStorage {
	/**
		Whether encryption is available.
		
		On Linux, returns true if the app has emitted the `ready` event and the secret key is available. On MacOS, returns true if Keychain is available. On Windows, returns true once the app has emitted the `ready` event.
	**/
	static function isEncryptionAvailable():Bool;
	/**
		An array of bytes representing the encrypted string.
		
		This function will throw an error if encryption fails.
	**/
	static function encryptString(plainText:String):js.node.Buffer;
	/**
		the decrypted string. Decrypts the encrypted buffer obtained  with `safeStorage.encryptString` back into a string.
		
		This function will throw an error if decryption fails.
	**/
	static function decryptString(encrypted:js.node.Buffer):String;
	/**
		This function on Linux will force the module to use an in memory password for creating symmetric key that is used for encrypt/decrypt functions when a valid OS password manager cannot be determined for the current active desktop environment. This function is a no-op on Windows and MacOS.
	**/
	static function setUsePlainTextEncryption(usePlainText:Bool):Void;
	/**
		User friendly name of the password manager selected on Linux.
		
		This function will return one of the following values:
		
		* `basic_text` - When the desktop environment is not recognised or if the following command line flag is provided `--password-store="basic"`.
		* `gnome_libsecret` - When the desktop environment is `X-Cinnamon`, `Deepin`, `GNOME`, `Pantheon`, `XFCE`, `UKUI`, `unity` or if the following command line flag is provided `--password-store="gnome-libsecret"`.
		* `kwallet` - When the desktop session is `kde4` or if the following command line flag is provided `--password-store="kwallet"`.
		* `kwallet5` - When the desktop session is `kde5` or if the following command line flag is provided `--password-store="kwallet5"`.
		* `kwallet6` - When the desktop session is `kde6`.
		* `unknown` - When the function is called before app has emitted the `ready` event.
	**/
	static function getSelectedStorageBackend():String;
}