package electron.main;

/**
	> Instantiates a special "other items proxy", which nests TouchBar elements inherited from Chromium at the space indicated by the proxy. By default, this proxy is added to each TouchBar at the end of the input. For more information, see the AppKit docs on NSTouchBarItemIdentifierOtherItemsProxy

Note: Only one instance of this class can be added per TouchBar.

Process: Main<br /> _This class is not exported from the `'electron'` module. It is only available as a return value of other methods in the Electron API._

	See: <https://electronjs.org/docs/api/touch-bar-other-items-proxy>
**/
@:require(js, hxelectron) @:jsRequire("electron", "TouchBarOtherItemsProxy") extern class TouchBarOtherItemsProxy extends js.node.events.EventEmitter<electron.main.TouchBarOtherItemsProxy> {
	function new():Void;
}

/**
**/
@:require(js, hxelectron) enum abstract TouchBarOtherItemsProxyEvent(String) from String to String {

}