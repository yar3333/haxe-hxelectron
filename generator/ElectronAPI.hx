import haxe.Json;
import haxe.ds.StringMap;
import sys.FileSystem;
import sys.io.File;
import haxe.macro.Expr;
using StringTools;
using Lambda;

typedef APIType =
{
    collection: Bool,
    type: SafeEitherType<String, Array<APIType>>,
    ?properties: Array<APIProperty>, // for type = Object
    ?innerTypes: Array<APIType>, // for Partial, Record
    ?possibleValues: Array<{ value:String, description:String }>, // for type = String
    ?parameters: Array<APIMethodParameter>, // for type = function
    ?returns: APIType // for type = function
};

typedef APIProperty =
{>APIType,
	name : String,
	?description : String,
    required: Bool
}

typedef APIEvent =
{
	name : String,
	?description : String,
	?platforms : Array<String>,
	returns : Array<APIReturn>
}

typedef APIMethodParameter =
{>APIType,
	name : String,
	?description : String,
	required: Null<Bool>,
}

typedef APIReturn = APIType;

typedef APIMethod =
{
	name : String,
	signature : String,
	description : String,
	returns : APIReturn,
	parameters : Array<APIMethodParameter>,
	platforms : Array<String>
}

typedef APIProcess =
{
	var main : Bool;
	var renderer : Bool;
    var exported : Bool;
    var utility : Bool;
}

enum abstract APIItemType(String) from String to String
{
	var Module = "Module";
	var Class_ = "Class";
	var Structure = "Structure";
}

typedef APIItem =
{
	name : String,
	description : String,
	process : APIProcess,
	version : String,
	type : APIItemType,
	slug : String,
	websiteUrl : String,
	repoUrl : String,
	methods : Array<APIMethod>,
	?instanceEvents : Array<APIEvent>,
	?instanceName : String,
	?instanceProperties : Array<APIProperty>,
	?instanceMethods : Array<APIMethod>,
	?constructorMethod : APIMethod,
	?staticMethods : Array<APIMethod>,
	?properties : Array<APIProperty>,
	?events : Array<APIEvent>,
};

/**
	Generates extern type definitions from electron-api.json
**/
class ElectronAPI
{
	public static function main()
    {
        var file = 'electron-api.json';
        var out = '../library';
        
        if (!FileSystem.exists(file)) { Sys.println('API file not found `$file`.'); Sys.exit(1); }

        deleteDirectory(out + "/electron");
        
        var pack = ['electron'];
        var electronApiJsonText = File.getContent(file);
        var json = Json.parse(electronApiJsonText);
        
        var types = build(json, pack);
        
        var sourceCode = new StringMap<String>();
        var printer = new haxe.macro.Printer();
        
        Sys.println('Generated [${types.length}] types into [$out]:');
        for (type in types)
        {
            Sys.println("\t" + type.pack.concat([type.name]).join("."));
            
            var modulePath = type.pack.join('.');
            var moduleName = type.name;
            
            var doc = '/**';
            for (item in json)
            {
                if (item.name == type.name)
                {
                    if (item.description != null) doc += '\n\t' + item.description + '\n';
                    if (item.websiteUrl != null) doc += '\n\tSee: <' + item.websiteUrl + '>';
                    break;
                }
            }
            doc += '\n**/';
            
            var code = printer.printTypeDefinition(type);
            var lines = code.split('\n' );
            code = lines.shift() + '\n';
            code += '\n'+ doc +'\n';
            code += lines.join('\n' );
            
            var classPath = modulePath + '.' + moduleName;

            if (moduleName.endsWith("Event") && modulePath != "electron")
            {
                addCodeToMap(sourceCode, modulePath, code);
            }
            else                              
            {
                addCodeToMap(sourceCode, classPath, code);
            }
        }
        
        for (key in sourceCode.keys())
        {
            var parts = key.split('.');
            var file = parts.pop();
            var dir = out + '/' + parts.join('/');
            if (!FileSystem.exists(dir)) FileSystem.createDirectory(dir);
            var text = sourceCode.get(key);

            if (parts.join(".") == "electron")
            {
                text = ~/^(package.*)/.replace(text, "$1\n\nimport electron.main.*;");
            }

            File.saveContent(dir + '/' + file + '.hx', text);
        }
    }

    static function addCodeToMap(sourceCode:StringMap<String>, module:String, code:String) : Void
    {
        if (!sourceCode.exists(module))
        {
            sourceCode.set(module, code);
        }
        else
        {
            if (code.startsWith("package"))
            {
                code = code.split('\n').slice(1).join('\n' );
                sourceCode.set(module, sourceCode.get(module) + '\n' + code);
            }
            else throw "Code must start from 'package'";
        }
    }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////

	static var KWDS = ['class','switch'];

	public static var pos(default, null) = #if macro null #else { min: 0, max: 0, file: '' } #end;

	static var _api : Array<APIItem>;

	public static function build(api:Array<APIItem>, ?pack:Array<String>) : Array<TypeDefinition>
	{
		_api = api;

		if (pack == null) pack = ['electron'];

		var types = new Array<TypeDefinition>();

		for (item in api)
		{
            var itemTypes = convertItem(item, pack).filter(x -> x != null);

            if (item.type == Module)
            {
                // merge modules with same name into one
                for (itemType in itemTypes)
                {
                    var oldType = types.find(t -> itemType.name == t.name && itemType.pack.join('.') == t.pack.join('.'));
                    if (oldType != null)
                    {
                        itemType.fields = itemType.fields.concat(oldType.fields);
                        types.remove(oldType);
                    }
                }
            }

			types = types.concat(itemTypes);
		}

		///// PATCH ////////////////////////////////////////////////////////////

		for (type in types)
		{
			switch type.name
			{
				case 'App':
					type.fields.push
					({
						name: 'on',
						access: [AStatic],
						kind: FFun({ args: [
							{ name: 'eventType', type:macro:Dynamic },
							{ name: 'callback', type:macro:Dynamic->Void }
						], ret:macro: Void, expr:null }),
						pos: pos
					});
					
				case 'Remote':
					var manipulateReturn = function(f:Field)
					{
						switch f.kind
						{
							case FFun(f):
								switch f.ret
								{
									case TPath(p):
										p.pack = ['electron','main'];
									default:
								}
							default:
						}
					};
					for (f in type.fields)
					{
						switch (f.name)
						{
							case 'getCurrentWindow','getCurrentWebContents': manipulateReturn(f);
						}
					}
            }

            // fix if module and class has same name
            var anotherType = types.find(x -> x != type && x.name == type.name && x.pack.join(".") == type.pack.join("."));
            if (anotherType != null)
            {
                var typeJsRequireMeta = type.meta != null ? type.meta.find(x -> x.name == ":jsRequire") : null;
                if (typeJsRequireMeta != null)
                {
                    var typeToFix = ~/^[a-z]/.match(getClassNameFromJsRequire(typeJsRequireMeta)) ? type : anotherType;
                    typeToFix.name += "Tools";
                }
            }
		}

		types.push(createTypeDefinition(pack, 'Accelerator', TDAlias(macro : Dynamic)));
		types.push(createTypeDefinition(pack, 'GlobalRequest', TDAlias(macro : Dynamic)));
		types.push(createTypeDefinition(pack, 'GlobalResponse', TDAlias(macro : Dynamic)));
		types.push(createTypeDefinition(pack, 'ReadableStream', TDAlias(macro : Dynamic)));

		////////////////////////////////////////////////////////////////////////

		return types;
	}

    static function getClassNameFromJsRequire(meta:{ params:Array<Expr> }) : String
    {
        switch (meta.params[1].expr)
        {
            case EConst(CString(s, _)): return s;
            case _: return null;
        }
    }

	static function convertItem(item:APIItem, pack:Array<String>) : Array<TypeDefinition>
	{
		var pack = pack.copy();
		var meta = [];

        if      (item.process != null && item.process.main)     pack.push('main' );
        else if (item.process != null && item.process.renderer) pack.push('renderer' );

		var fields = new Array<Field>();
		var extraTypes = new Array<TypeDefinition>();

		var def = switch item.type
		{
            case Class_:
                var sup : TypePath = null;
                
                if (item.instanceEvents != null)
                {
                    sup = {
                        pack: ['js','node','events'], name: 'EventEmitter',
                        params: [TPType(TPath({ name: item.name, pack:pack }))]
                    };
                    extraTypes.push(createEventAbstract(pack, item.name, item.instanceEvents) );
                }

                if (item.instanceProperties != null)
                    for (p in item.instanceProperties) fields.push(parseField(p));
                
                if (item.constructorMethod != null)
                    fields.push(convertMethod(item.constructorMethod));
                
                if (item.instanceMethods != null)
                    for (m in item.instanceMethods)
                        fields.push(convertMethod(m));
                
                if (item.staticMethods != null)
                    for (m in item.staticMethods)
                        fields.push(convertMethod(m, [AStatic]));
                
                createClassTypeDefinition(pack, item.name, sup, fields, meta);

            case Module:
                var sup : TypePath = null;
                if (item.methods != null)
                {
                    //TODO hack
                    var alreadyAdded = false;
                    for (m in item.methods)
                    {
                        for (f in fields)
                        {
                            if (f.name == m.name)
                            {
                                trace('WARNING Duplicate module method name: ' + item.name+'.' + m.name);
                                alreadyAdded = true;
                                break;
                            }
                        }
                        if (!alreadyAdded) fields.push(convertMethod(m, [AStatic]));
                    }
                }
                createClassTypeDefinition(pack, item.name, sup, fields, meta);
                
            case Structure:
                for (p in item.properties) fields.push(parseField(p));
                createTypeDefinition(pack, item.name, TDStructure, fields, meta);
		}

		var types = [def];
		for (def in extraTypes) types.push(def);
		return types;
	}

    static function isOptional(t:APIProperty) : Bool
    {
        return Reflect.hasField(t, "required") && !t.required || t.description != null && t.description.startsWith('(optional)');
    }

	static function convertMethod(method:APIMethod, ?access:Array<Access>) : Field
	{
		var ret = method.returns != null 
                    ? convertType(method.returns) 
                    : (macro : Void);
		
		var args = new Array<FunctionArg>();
		if (method.parameters != null)
		{
			for (p in method.parameters)
            {
                args.push({ 
                    name: p.name == "...args" ? 'args'                      : escapeName(p.name),
                    type: p.name == "...args" ? macro:haxe.extern.Rest<Any> : convertType(p),
                    opt:  p.name == "...args" ? false                       : isOptional(p)
                });
			}
		}

		return {
            name: method.name == null ? 'new' : method.name,
            kind: FFun({ args: args, ret:ret, expr:null }),
            access: access,
            doc: method.description,
            pos: pos
        };
	}

	static function convertType(t:APIType) : ComplexType
	{
		if (t == null || t.type == null || t.type.asA() == "") return macro : Dynamic;
        
        if (Std.isOfType(t.type, Array))
        {
            var arr = t.type.asB();
            if (arr.exists(isUndefinedOrNull))
            {
                arr = arr.filter(x -> !isUndefinedOrNull(x));
                return TPath({ name: "Null", pack: [], params: [ TPType(generateEitherType(arr)) ] });
            }
            return generateEitherType(arr);
        }
        var type = t.type.asA().trim();

        if (type.indexOf("[") >= 0 || type.indexOf("&") >= 0 || type.indexOf("{") >= 0 || type.indexOf("?") >= 0) return parseComplexType(type);

        if (type.startsWith("'")) return macro : String;
        
		var ctype = switch type.toLowerCase()
		{
			case 'blob': macro : js.html.Blob;
			case 'bool','boolean': macro : Bool;
			case 'buffer': macro : js.node.Buffer;
			case 'int','integer': macro : Int;
			
            case 'dynamic', 'unknown', 'any', 'partial', 'record', 
                    'abortsignal', 
                    'touchbaritem', 
                    'menuitemconstructoroptions'
                : macro : Dynamic;
			
            case 'double','float','number': macro : Float;
			case 'function':
				if (t.parameters == null) macro : haxe.Constraints.Function;
				else 					  TFunction([for (p in t.parameters) convertType(p)], convertType(t.returns));
			case 'object':
				if (t.properties == null) macro : Dynamic 
                else TAnonymous(t.properties.map(parseField));
				
			case 'promise': TPath({ name: "Promise", pack: ["js", "lib"], params: [ TPType(t.innerTypes!=null && t.innerTypes.length==1 ? convertType(t.innerTypes[0]) : (macro : Dinamic)) ] });
			case 'string','url': macro : String;
			default: TPath({ pack:[], name:escapeTypeName(type) });
		};

		if (!t.collection) return ctype;
        
        return switch ctype
		{
			case TPath(p) : TPath({ name: 'Array<${p.name}>', pack: [] });
            case TAnonymous(fields): TAnonymous(fields);
			default: throw 'failed to convert array type';
		};
	}

    static function isUndefinedOrNull(x:APIType) : Bool
    {
        return [ "undefined", "null" ].indexOf(x.type.asA().toString().toLowerCase()) >= 0;
    }

    static function parseField(p:APIProperty) : Field
    {
        var meta = new Metadata();
        var name = p.name;
		if (~/^([0-9] +).+/.match(name))
        {
            meta.push({ name: ':native', params: [macro $i{ '"' + name + '"' }], pos: pos });
            name = '_$name';
        }

        return {
            name: escapeName(p.name),
            kind: FVar(convertType(p)),
            meta: isOptional(p) ? [ { name: ":optional", pos:pos } ] : [],
            pos: pos,
            doc: p.description
        };
    }

    static function generateEitherType(types:Array<APIType>) : ComplexType
    {
        if (types.length == 0) return macro : Dynamic;
        if (types.length == 1) return convertType(types[0]);
        return TPath({ name: 'EitherType', pack: ['haxe', 'extern'], params: [ TPType(convertType(types[0])), TPType(generateEitherType(types.slice(1))) ] });
    }

    static function parseComplexType(type:String) : ComplexType
    {
        // type = "[ { a:String, b:Int }, { d:String, e:Object } ]"
        // type = "{ a:String, b:Int, d?:String, e:Object }"
        // type = "Abc & { a:String, b:Int, d?:String, e:Object }"

        return macro : Dynamic;

        /*if (type.indexOf("{") >= 0) return macro : Dynamic; // TODO: parse anonymous structures

        var raws = type.substr(1, type.length - 2).split(",").map(x -> x.trim()).filter(x -> x != "");
        if (raws.length == 0) return macro : Dynamic;
        
        var types = raws.map(x -> convertType(x.trim(), null, false));

        if (types.length == 1) return types[0];
        
        var result = (macro:haxe.extern.EitherType);
        var current = result;
        for (i in 0...types.length)
        {
            var t = types[i];
            switch current
            {
                case TPath(c):
                    if (c.params.length >= 1 && i < types.length-1)
                    {
                        t = TPath( { name: 'EitherType', pack: ['haxe', 'extern'], params: [ TPType(t) ] } );
                    }
                case _:
            }
            switch current
            {
                case TPath(c):
                    c.params.push(TPType(t) );
                    if (c.params.length >= 2) current = t;
                case _:
            }
        }
        return result;*/
    }

    /*static function findTypeMatch(type:String) : ComplexType
    {
        for (item in _api) if (item.name == type)
        {
            var result = { name: item.name, pack: ['electron'] };
            
            if      (item.process != null && item.process.main)     result.pack.push('main' );
            else if (item.process != null && item.process.renderer) result.pack.push('renderer' );
            
            return TPath(result);
        }
        return null;
    }*/

	static function createAlias(name:String, pack:Array<String>, ?type:ComplexType) : TypeDefinition
	{
		return createTypeDefinition(pack, name, TDAlias((type == null) ? macro:Dynamic : type));
	}

	/*static inline function createField(name:String, kind:FieldType, ?access:Array<Access>, ?doc:String, ?meta:Metadata) : Field
	{
		if (~/^([0-9] +).+/.match(name))
		{
			meta.push({ name: ':native', params: [macro $i{ '"' + name + '"' }], pos: pos });
			name = '_$name';
		}
		return
		{
			access: access,
			name: name,
			kind: kind,
			doc: doc,
			meta: meta,
			pos: pos
		}
	}*/

	static function createTypeDefinition(pack:Array<String>, name:String, kind:TypeDefKind, ?fields:Array<Field>, ?meta:Metadata, ?isExtern:Bool) : TypeDefinition
	{
		var _meta = [{ name: ':require', params: [macro $i{'js'},macro $i{'hxelectron' }], pos:pos }];
		if (meta != null) _meta = _meta.concat(meta);
		return
		{
			pack: pack,
			name: escapeTypeName(name),
			kind: kind,
			fields: (fields == null) ? [] : fields,
			meta: _meta,
			isExtern: isExtern,
			pos: pos
		};
	}

	static function createClassTypeDefinition(pack:Array<String>, name:String, sup:TypePath, ?fields:Array<Field>, ?meta:Metadata) : TypeDefinition
	{
		var _meta =
		[{
			name: ":jsRequire",
			params: [
				{ expr: EConst(CString('electron' ) ), pos:pos },
				{ expr: EConst(CString(name) ), pos:pos }
			],
			pos: pos
		}];
		if (meta != null) _meta = _meta.concat(meta);
		return createTypeDefinition(pack, name, TDClass(sup), fields, _meta, true);
	}

	static function createEventAbstract(pack:Array<String>, name:String, events:Array<APIEvent>) : TypeDefinition
	{
		var fields = new Array<Field>();
		for (e in events)
		{
			var ename : String = e.name;
			fields.push
			({
				name: ename.replace('-', '_' ),
				kind: FVar(macro:String, { expr: EConst(CString(ename) ), pos:pos }),
				doc: e.description,
				pos: pos
			});
		}
		var _pack = pack.copy();
		var _name = escapeTypeName(name);
		_pack.push(_name);
		return createTypeDefinition(_pack, _name + 'Event', TDAbstract(macro:String, [ AbEnum ], [ macro:String ], [ macro:String ]), fields);
	}
	
	static function escapeTypeName(name:String) : String return name.charAt(0).toUpperCase() + name.substr(1);
	
	static function escapeName(name:String) : String return (KWDS.indexOf(name) != -1) ? name + '_' : name;

    public static function deleteDirectory(path:String) : Void
    {
        if (FileSystem.exists(path))
        {
            for (file in FileSystem.readDirectory(path))
            {
                var s = path + "/" + file;
                if (FileSystem.isDirectory(s))
                {
                    deleteDirectory(s);
                }
                else
                {
                    FileSystem.deleteFile(s);
                }
            }
            sys.FileSystem.deleteDirectory(path);
        }
    }    
}

abstract SafeEitherType<A, B>(Dynamic) from A from B
{
    public inline function asA(): A return this;
    public inline function asB(): B return this;
}
