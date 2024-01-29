package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/native-image>
**/
@:require(js, hxelectron) @:jsRequire("electron", "NativeImage") extern class NativeImage extends js.node.events.EventEmitter<electron.NativeImage> {
	/**
		A `boolean` property that determines whether the image is considered a template image.
		
		Please note that this property only has an effect on macOS.
	**/
	var isMacTemplateImage : Bool;
	/**
		A Buffer that contains the image's `PNG` encoded data.
	**/
	function toPNG(?options:{ /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):js.node.Buffer;
	/**
		A Buffer that contains the image's `JPEG` encoded data.
	**/
	function toJPEG(quality:Int):js.node.Buffer;
	/**
		A Buffer that contains a copy of the image's raw bitmap pixel data.
	**/
	function toBitmap(?options:{ /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):js.node.Buffer;
	/**
		The data URL of the image.
	**/
	function toDataURL(?options:{ /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):String;
	/**
		A Buffer that contains the image's raw bitmap pixel data.
		
		The difference between `getBitmap()` and `toBitmap()` is that `getBitmap()` does not copy the bitmap data, so you have to use the returned Buffer immediately in current event loop tick; otherwise the data might be changed or destroyed.
	**/
	function getBitmap(?options:{ /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):js.node.Buffer;
	/**
		A Buffer that stores C pointer to underlying native handle of the image. On macOS, a pointer to `NSImage` instance would be returned.
		
		Notice that the returned pointer is a weak pointer to the underlying native image instead of a copy, so you _must_ ensure that the associated `nativeImage` instance is kept around.
	**/
	function getNativeHandle():js.node.Buffer;
	/**
		Whether the image is empty.
	**/
	function isEmpty():Bool;
	/**
		If `scaleFactor` is passed, this will return the size corresponding to the image representation most closely matching the passed value.
	**/
	function getSize(?scaleFactor:Float):Size;
	/**
		Marks the image as a template image.
	**/
	function setTemplateImage(option:Bool):Void;
	/**
		Whether the image is a template image.
	**/
	function isTemplateImage():Bool;
	/**
		The cropped image.
	**/
	function crop(rect:Rectangle):NativeImage;
	/**
		The resized image.
		
		If only the `height` or the `width` are specified then the current aspect ratio will be preserved in the resized image.
	**/
	function resize(options:{ /**
		Defaults to the image's width.
	**/
	@:optional
	var width : Int; /**
		Defaults to the image's height.
	**/
	@:optional
	var height : Int; /**
		The desired quality of the resize image. Possible values include `good`, `better`, or `best`. The default is `best`. These values express a desired quality/speed tradeoff. They are translated into an algorithm-specific method that depends on the capabilities (CPU, GPU) of the underlying platform. It is possible for all three methods to be mapped to the same algorithm on a given platform.
	**/
	@:optional
	var quality : String; }):NativeImage;
	/**
		The image's aspect ratio.
		
		If `scaleFactor` is passed, this will return the aspect ratio corresponding to the image representation most closely matching the passed value.
	**/
	function getAspectRatio(?scaleFactor:Float):Float;
	/**
		An array of all scale factors corresponding to representations for a given nativeImage.
	**/
	function getScaleFactors():Array<Float>;
	/**
		Add an image representation for a specific scale factor. This can be used to explicitly add different scale factor representations to an image. This can be called on empty images.
	**/
	function addRepresentation(options:{ /**
		The scale factor to add the image representation for.
	**/
	@:optional
	var scaleFactor : Float; /**
		Defaults to 0. Required if a bitmap buffer is specified as `buffer`.
	**/
	@:optional
	var width : Int; /**
		Defaults to 0. Required if a bitmap buffer is specified as `buffer`.
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

/**
**/
@:require(js, hxelectron) enum abstract NativeImageEvent(String) from String to String {

}