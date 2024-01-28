package electron;

/**
	**Note:** Both `x` and `y` must be whole integers, when providing a point object as input to an Electron API we will automatically round your `x` and `y` values to the nearest whole integer.

	See: <https://electronjs.org/docs/api/structures/point>
**/
@:require(js, hxelectron) typedef Point = {
	var x : Float;
	var y : Float;
}