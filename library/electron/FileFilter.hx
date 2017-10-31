package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/file-filter>
**/
@:require(js, hxelectron) typedef FileFilter =
{
	var name : String;
	var extensions : Array<String>;
}