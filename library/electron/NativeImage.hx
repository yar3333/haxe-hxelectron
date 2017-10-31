package electron;

/**
	Natively wrap images such as tray, dock, and application icons.

	See: <http://electron.atom.io/docs/api/native-image>
**/
@:require(js, electron) @:jsRequire("electron", "NativeImage") extern class NativeImage {
	function toPNG(?options:{ /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):js.node.Buffer;
	function toJPEG(quality:Int):js.node.Buffer;
	function toBitmap(?options:{ /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):js.node.Buffer;
	function toDataURL(?options:{ /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):String;
	/**
		The difference between getBitmap() and toBitmap() is, getBitmap() does not copy the bitmap data, so you have to use the returned Buffer immediately in current event loop tick, otherwise the data might be changed or destroyed.
	**/
	function getBitmap(?options:{ /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):js.node.Buffer;
	/**
		Notice that the returned pointer is a weak pointer to the underlying native image instead of a copy, so you must ensure that the associated nativeImage instance is kept around.
	**/
	function getNativeHandle():js.node.Buffer;
	function isEmpty():Bool;
	function getSize():Size;
	/**
		Marks the image as a template image.
	**/
	function setTemplateImage(option:Bool):Void;
	function isTemplateImage():Bool;
	function crop(rect:Rectangle):NativeImage;
	/**
		If only the height or the width are specified then the current aspect ratio will be preserved in the resized image.
	**/
	function resize(options:{ /**
		Defaults to the image's width.
	**/
	@:optional
	var width : Int; /**
		Defaults to the image's height
	**/
	@:optional
	var height : Int; /**
		The desired quality of the resize image. Possible values are good, better or best. The default is best. These values express a desired quality/speed tradeoff. They are translated into an algorithm-specific method that depends on the capabilities (CPU, GPU) of the underlying platform. It is possible for all three methods to be mapped to the same algorithm on a given platform.
	**/
	@:optional
	var quality : String; }):NativeImage;
	function getAspectRatio():Float;
	/**
		Add an image representation for a specific scale factor. This can be used to explicitly add different scale factor representations to an image. This can be called on empty images.
	**/
	function addRepresentation(options:{ /**
		The scale factor to add the image representation for.
	**/
	@:optional
	var scaleFactor : Float; /**
		Defaults to 0. Required if a bitmap buffer is specified as buffer.
	**/
	@:optional
	var width : Int; /**
		Defaults to 0. Required if a bitmap buffer is specified as buffer.
	**/
	@:optional
	var height : Int; /**
		The buffer containing the raw image data.
	**/
	@:optional
	var buffer : js.node.Buffer; /**
		The data URL containing either a base 64 encoded PNG or JPEG image.
	**/
	@:optional
	var dataURL : String; }):Void;
}