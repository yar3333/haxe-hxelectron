package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/crash-report>
**/
@:require(js, hxelectron) typedef CrashReport =
{
	var date : String;
	var ID : Int;
}