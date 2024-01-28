haxelib install refactor
mkdir ..\library\electron\remote 2> nul
xcopy /q /y ..\library\electron\main\* ..\library\electron\remote
haxelib run refactor replace ..\library\electron\remote *.hx ^
	"/^^package electron.main/package electron.remote/" ^
	"/@:jsRequire\(""electron"", ""/@:jsRequire(""electron"", ""remote./"
