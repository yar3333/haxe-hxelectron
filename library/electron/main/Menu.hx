package electron.main;

/**
	

### Class: Menu

> Create native application menus and context menus.

Process: Main

	See: <https://electronjs.org/docs/api/menu>
**/
@:require(js, hxelectron) @:jsRequire("electron", "Menu") extern class Menu extends js.node.events.EventEmitter<electron.main.Menu> {
	/**
		A `MenuItem[]` array containing the menu's items.
		
		Each `Menu` consists of multiple `MenuItem`s and each `MenuItem` can have a submenu.
	**/
	var items : Array<MenuItem>;
	function new():Void;
	/**
		Pops up this menu as a context menu in the `BrowserWindow`.
	**/
	function popup(?options:{ /**
		Default is the focused window.
	**/
	@:optional
	var window : BrowserWindow; /**
		Default is the current mouse cursor position. Must be declared if `y` is declared.
	**/
	@:optional
	var x : Float; /**
		Default is the current mouse cursor position. Must be declared if `x` is declared.
	**/
	@:optional
	var y : Float; /**
		The index of the menu item to be positioned under the mouse cursor at the specified coordinates. Default is -1.
	**/
	@:optional
	var positioningItem : Float; /**
		This should map to the `menuSourceType` provided by the `context-menu` event. It is not recommended to set this value manually, only provide values you receive from other APIs or leave it `undefined`. Can be `none`, `mouse`, `keyboard`, `touch`, `touchMenu`, `longPress`, `longTap`, `touchHandle`, `stylus`, `adjustSelection`, or `adjustSelectionReset`.
	**/
	@:optional
	var sourceType : String; /**
		Called when menu is closed.
	**/
	@:optional
	var callback : () -> Dynamic; }):Void;
	/**
		Closes the context menu in the `browserWindow`.
	**/
	function closePopup(?browserWindow:BrowserWindow):Void;
	/**
		Appends the `menuItem` to the menu.
	**/
	function append(menuItem:MenuItem):Void;
	/**
		the item with the specified `id`
	**/
	function getMenuItemById(id:String):Null<MenuItem>;
	/**
		Inserts the `menuItem` to the `pos` position of the menu.
	**/
	function insert(pos:Int, menuItem:MenuItem):Void;
	/**
		Sets `menu` as the application menu on macOS. On Windows and Linux, the `menu` will be set as each window's top menu.
		
		Also on Windows and Linux, you can use a `&` in the top-level item name to indicate which letter should get a generated accelerator. For example, using `&File` for the file menu would result in a generated `Alt-F` accelerator that opens the associated menu. The indicated character in the button label then gets an underline, and the `&` character is not displayed on the button label.
		
		In order to escape the `&` character in an item name, add a proceeding `&`. For example, `&&File` would result in `&File` displayed on the button label.
		
		Passing `null` will suppress the default menu. On Windows and Linux, this has the additional effect of removing the menu bar from the window.
		
		**Note:** The default menu will be created automatically if the app does not set one. It contains standard items such as `File`, `Edit`, `View`, `Window` and `Help`.
	**/
	static function setApplicationMenu(menu:Null<Menu>):Void;
	/**
		The application menu, if set, or `null`, if not set.
		
		**Note:** The returned `Menu` instance doesn't support dynamic addition or removal of menu items. Instance properties can still be dynamically modified.
	**/
	static function getApplicationMenu():Null<Menu>;
	/**
		Sends the `action` to the first responder of application. This is used for emulating default macOS menu behaviors. Usually you would use the `role` property of a `MenuItem`.
		
		See the macOS Cocoa Event Handling Guide for more information on macOS' native actions.
	**/
	static function sendActionToFirstResponder(action:String):Void;
	/**
		Generally, the `template` is an array of `options` for constructing a MenuItem. The usage can be referenced above.
		
		You can also attach other fields to the element of the `template` and they will become properties of the constructed menu items.
	**/
	static function buildFromTemplate(template:haxe.extern.EitherType<Dynamic, MenuItem>):Menu;
}

/**
**/
@:require(js, hxelectron) enum abstract MenuEvent(String) from String to String {
	/**
		Emitted when `menu.popup()` is called.
	**/
	var menu_will_show : String = "menu-will-show";
	/**
		Emitted when a popup is closed either manually or with `menu.closePopup()`.
	**/
	var menu_will_close : String = "menu-will-close";
}