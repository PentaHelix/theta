package theta;

#if !macro 
import theta.components.Component;

interface SystemBase {
	public function start ():Void;
	public function update ():Void;
}

@:genericBuild(theta.System.build())
class System<Rest> {}
#else

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.Resource;
import haxe.io.Bytes;
import tink.macro.BuildCache;

using tink.MacroApi;
using haxe.macro.TypeTools;
using StringTools;
using Lambda;

class System {
	public static var COUNT:Int = 0;
  public static function build () {
	
		var types:Array<haxe.macro.Type> = [];

    switch Context.getLocalType() {
			case TInst(_, t):	types = t;
			default: throw 'System needs type parameters';
		}

		var aspect = macro class View {};

		for(type in types) {
      var cls = type.getClass();
      aspect.fields.push({
        name: cls.name.substr(0, 1).toLowerCase() + cls.name.substr(1),
        kind: FVar(type.toComplex()),
        access: [APublic],
        meta: null,
        pos: Context.currentPos()
      });
    }

		return BuildCache.getTypeN('theta.System', types, ctx -> {
			aspect.pack = ['theta', 'systems', ctx.name, 'View'];
			Context.defineType(aspect);
			buildClass(ctx.name, types);
		});
  }

	static function buildClass(name:String, types:Array<haxe.macro.Type>): haxe.macro.TypeDefinition {
		var componentArgs:Array<FunctionArg> = [];
		var i = 0;
		
		var def = macro class $name implements theta.System.SystemBase {
			private var entities:Array<Int>;
			public function start () {};
			public function update () {};
		}

		switch def.fields.find(f -> f.name == 'entities').kind {
			case FVar(TPath(t)):
				t.params = [TPType(TPath({
					name: 'View',
					pack: ['theta', 'systems', name]
				}))];
			default:
		}

		def.pack = ['theta', 'systems', name]; 

		def.meta = [
			{
				name: ':autoBuild',
				params: [
					Context.parse('theta.util.Macro.buildSystem()', Context.currentPos())
				],
				pos: Context.currentPos()
			}
		];
		return def;
	}
}

#end