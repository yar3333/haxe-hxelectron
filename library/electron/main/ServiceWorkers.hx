package electron.main;

/**
	

	See: <https://electronjs.org/docs/api/service-workers>
**/
@:require(js, hxelectron) @:jsRequire("electron", "ServiceWorkers") extern class ServiceWorkers extends js.node.events.EventEmitter<electron.main.ServiceWorkers> {
	/**
		A ServiceWorkerInfo object where the keys are the service worker version ID and the values are the information about that service worker.
	**/
	function getAllRunning():Record;
	/**
		Information about this service worker
		
		If the service worker does not exist or is not running this method will throw an exception.
	**/
	function getFromVersionID(versionId:Float):ServiceWorkerInfo;
}

/**
**/
@:require(js, hxelectron) enum abstract ServiceWorkersEvent(String) from String to String {
	/**
		Emitted when a service worker logs something to the console.
	**/
	var console_message : String = "console-message";
	/**
		Emitted when a service worker has been registered. Can occur after a call to `navigator.serviceWorker.register('/sw.js')` successfully resolves or when a Chrome extension is loaded.
	**/
	var registration_completed : String = "registration-completed";
}