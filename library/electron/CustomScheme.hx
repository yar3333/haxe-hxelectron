package electron;

/**
	

	See: <https://electronjs.org/docs/api/structures/custom-scheme>
**/
@:require(js, hxelectron) typedef CustomScheme = {
	/**
		Custom schemes to be registered with options.
	**/
	var scheme : String;
	var privileges : { /**
		Default false.
	**/
	@:optional
	var standard : Bool; /**
		Default false.
	**/
	@:optional
	var secure : Bool; /**
		Default false.
	**/
	@:optional
	var bypassCSP : Bool; /**
		Default false.
	**/
	@:optional
	var allowServiceWorkers : Bool; /**
		Default false.
	**/
	@:optional
	var supportFetchAPI : Bool; /**
		Default false.
	**/
	@:optional
	var corsEnabled : Bool; /**
		Default false.
	**/
	@:optional
	var stream : Bool; /**
		Enable V8 code cache for the scheme, only works when `standard` is also set to true. Default false.
	**/
	@:optional
	var codeCache : Bool; };
}