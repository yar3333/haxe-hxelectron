package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/jump-list-item>
**/
@:require(js, electron) typedef JumpListItem = {
	/**
		One of the following:
	**/
	var type : String;
	/**
		Path of the file to open, should only be set if type is file.
	**/
	var path : String;
	/**
		Path of the program to execute, usually you should specify process.execPath which opens the current program. Should only be set if type is task.
	**/
	var program : String;
	/**
		The command line arguments when program is executed. Should only be set if type is task.
	**/
	var args : String;
	/**
		The text to be displayed for the item in the Jump List. Should only be set if type is task.
	**/
	var title : String;
	/**
		Description of the task (displayed in a tooltip). Should only be set if type is task.
	**/
	var description : String;
	/**
		The absolute path to an icon to be displayed in a Jump List, which can be an arbitrary resource file that contains an icon (e.g. .ico, .exe, .dll). You can usually specify process.execPath to show the program icon.
	**/
	var iconPath : String;
	/**
		The index of the icon in the resource file. If a resource file contains multiple icons this value can be used to specify the zero-based index of the icon that should be displayed for this task. If a resource file contains only one icon, this property should be set to zero.
	**/
	var iconIndex : Float;
}