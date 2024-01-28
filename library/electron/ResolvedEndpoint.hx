package electron;

/**
	

	See: <https://electronjs.org/docs/api/structures/resolved-endpoint>
**/
@:require(js, hxelectron) typedef ResolvedEndpoint = {
	var address : String;
	/**
		One of the following:
	**/
	var family : String;
}