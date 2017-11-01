hxelectron
==========

Haxe external classes for [Electron](http://electron.atom.io/).

Based on [electron](https://github.com/fponticelli/hxelectron) haxe library with next advantages:

	* some beauty generator code;
	* some beauty result haxe code;
	* added classes for using electron main thread features from renderer thread ("remote").
	
How upgrade library for specific `Electron` version:

	* you need Windows OS;
	* you need HaxeDevelop/FlashDevelop IDE;
	* replace file `generator/electron-api.json` with necessary version from [electron-api-docs](https://github.com/electron/electron-api-docs);
	* open `generator/generator.hxproj` and compile project;
	* look into `library` folder.
