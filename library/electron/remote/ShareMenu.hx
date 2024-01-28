package electron.remote;

/**
	The `ShareMenu` class creates Share Menu on macOS, which can be used to share information from the current context to apps, social media accounts, and other services.

For including the share menu as a submenu of other menus, please use the `shareMenu` role of `MenuItem`.

### Class: ShareMenu

> Create share menu on macOS.

Process: Main

	See: <https://electronjs.org/docs/api/share-menu>
**/
@:require(js, hxelectron) @:jsRequire("electron", "remote.ShareMenu") extern class ShareMenu extends js.node.events.EventEmitter<electron.main.ShareMenu> {
	function new(sharingItem:SharingItem):Void;
	/**
		Pops up this menu as a context menu in the `BrowserWindow`.
	**/
	function popup(?options:PopupOptions):Void;
	/**
		Closes the context menu in the `browserWindow`.
	**/
	function closePopup(?browserWindow:BrowserWindow):Void;
}

/**
**/
@:require(js, hxelectron) enum abstract ShareMenuEvent(String) from String to String {

}