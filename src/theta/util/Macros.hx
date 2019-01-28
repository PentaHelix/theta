package theta.util;

import haxe.io.Bytes;
import haxe.macro.Context;
import haxe.Resource;
import haxe.macro.Expr;
import haxe.macro.TypeTools;

class Macros {
  public static macro function registerComponent ():Array<Field> {
    var comps:String = Resource.getString('components');
    if (comps == null) comps = '';
    Context.addResource('components', Bytes.ofString(comps + Context.getLocalClass().get().name + ','));

    return null;
  }

  public static macro function getComponents () : Expr {
    return macro [];
  }
}