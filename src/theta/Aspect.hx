package theta;

#if !macro
@:genericBuild(theta.Aspect.build())
class Aspect<Rest> {}

#else

import haxe.macro.Expr;
import haxe.macro.Context;
import tink.macro.BuildCache;

using tink.MacroApi;
using haxe.macro.TypeTools;
using StringTools;
using Lambda;

class Aspect {
  public static function build () {
    var types:Array<haxe.macro.Type> = [];

    switch Context.getLocalType() {
			case TInst(_, t):	types = t;
			default:
		}

		return BuildCache.getTypeN('theta.Aspect', types, function(ctx:BuildContextN) {
			return buildClass(ctx.name, types, ctx.pos);
		});
  }

  static function buildClass (name:String, types:Array<haxe.macro.Type>, pos) {
    var def = macro class $name {

    }


    for(type in types) {
      var cls = type.getClass();
      def.fields.push({
        name: cls.name.substr(0, 1).toLowerCase() + cls.name.substr(1),
        kind: FVar(type.toComplex()),
        access: [APublic],
        meta: null,
        pos: pos
      });
    }
    return def;
  }
}
#end