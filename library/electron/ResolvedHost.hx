package electron;

/**
	

	See: <https://electronjs.org/docs/api/structures/resolved-host>
**/
@:require(js, hxelectron) typedef ResolvedHost = {
	/**
		resolved DNS entries for the hostname
	**/
	var endpoints : Array<ResolvedEndpoint>;
}