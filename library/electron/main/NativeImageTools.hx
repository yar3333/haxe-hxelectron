package electron.main;

/**
**/
@:require(js, hxelectron) @:jsRequire("electron", "nativeImage") extern class NativeImageTools {
	/**
		Creates an empty `NativeImage` instance.
	**/
	static function createEmpty():NativeImage;
	/**
		fulfilled with the file's thumbnail preview image, which is a NativeImage.
		
		Note: The Windows implementation will ignore `size.height` and scale the height according to `size.width`.
	**/
	static function createThumbnailFromPath(path:String, size:Size):js.lib.Promise<NativeImage>;
	/**
		Creates a new `NativeImage` instance from a file located at `path`. This method returns an empty image if the `path` does not exist, cannot be read, or is not a valid image.
	**/
	static function createFromPath(path:String):NativeImage;
	/**
		Creates a new `NativeImage` instance from `buffer` that contains the raw bitmap pixel data returned by `toBitmap()`. The specific format is platform-dependent.
	**/
	static function createFromBitmap(buffer:js.node.Buffer, options:{ var width : Int; var height : Int; /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):NativeImage;
	/**
		Creates a new `NativeImage` instance from `buffer`. Tries to decode as PNG or JPEG first.
	**/
	static function createFromBuffer(buffer:js.node.Buffer, ?options:{ /**
		Required for bitmap buffers.
	**/
	@:optional
	var width : Int; /**
		Required for bitmap buffers.
	**/
	@:optional
	var height : Int; /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):NativeImage;
	/**
		Creates a new `NativeImage` instance from `dataURL`.
	**/
	static function createFromDataURL(dataURL:String):NativeImage;
	/**
		Creates a new `NativeImage` instance from the NSImage that maps to the given image name. See `System Icons` for a list of possible values.
		
		The `hslShift` is applied to the image with the following rules:
		
		* `hsl_shift[0]` (hue): The absolute hue value for the image - 0 and 1 map to 0 and 360 on the hue color wheel (red).
		* `hsl_shift[1]` (saturation): A saturation shift for the image, with the following key values: 0 = remove all color. 0.5 = leave unchanged. 1 = fully saturate the image.
		* `hsl_shift[2]` (lightness): A lightness shift for the image, with the following key values: 0 = remove all lightness (make all pixels black). 0.5 = leave unchanged. 1 = full lightness (make all pixels white).
		
		This means that `[-1, 0, 1]` will make the image completely white and `[-1, 1, 0]` will make the image completely black.
		
		In some cases, the `NSImageName` doesn't match its string representation; one example of this is `NSFolderImageName`, whose string representation would actually be `NSFolder`. Therefore, you'll need to determine the correct string representation for your image before passing it in. This can be done with the following:
		
		`echo -e '#import <Cocoa/Cocoa.h>\nint main() { NSLog(@"%@", SYSTEM_IMAGE_NAME); }' | clang -otest -x objective-c -framework Cocoa - && ./test`
		
		where `SYSTEM_IMAGE_NAME` should be replaced with any value from this list.
	**/
	static function createFromNamedImage(imageName:String, ?hslShift:Array<Float>):NativeImage;
}