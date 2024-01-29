package electron.remote;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "remote.screen") extern class Screen {
	/**
		The current absolute position of the mouse pointer.
		
		**Note:** The return value is a DIP point, not a screen physical point.
	**/
	static function getCursorScreenPoint():Point;
	/**
		The primary display.
	**/
	static function getPrimaryDisplay():Display;
	/**
		An array of displays that are currently available.
	**/
	static function getAllDisplays():Array<Display>;
	/**
		The display nearest the specified point.
	**/
	static function getDisplayNearestPoint(point:Point):Display;
	/**
		The display that most closely intersects the provided bounds.
	**/
	static function getDisplayMatching(rect:Rectangle):Display;
	/**
		Converts a screen physical point to a screen DIP point. The DPI scale is performed relative to the display containing the physical point.
	**/
	static function screenToDipPoint(point:Point):Point;
	/**
		Converts a screen DIP point to a screen physical point. The DPI scale is performed relative to the display containing the DIP point.
	**/
	static function dipToScreenPoint(point:Point):Point;
	/**
		Converts a screen physical rect to a screen DIP rect. The DPI scale is performed relative to the display nearest to `window`. If `window` is null, scaling will be performed to the display nearest to `rect`.
	**/
	static function screenToDipRect(window:Null<BrowserWindow>, rect:Rectangle):Rectangle;
	/**
		Converts a screen DIP rect to a screen physical rect. The DPI scale is performed relative to the display nearest to `window`. If `window` is null, scaling will be performed to the display nearest to `rect`.
	**/
	static function dipToScreenRect(window:Null<BrowserWindow>, rect:Rectangle):Rectangle;
}