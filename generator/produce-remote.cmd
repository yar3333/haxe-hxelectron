haxelib install refactor
mkdir ..\library\electron\renderer\remote 2> nul
xcopy /q /y ..\library\electron\main\* ..\library\electron\renderer\remote
haxelib run refactor replace ..\library\electron\renderer\remote *.hx ^
	"/^^package electron.main/package electron.renderer.remote/" ^
	"/@:jsRequire\(""electron"", ""/@:jsRequire(""electron"", ""remote./"
