package theta;

import haxe.macro.Context;
import haxe.macro.Type;
import haxe.macro.Expr;

class Macros {
  public static macro function requiresComponents (f:Expr):Expr {
    // var fType:Type = Context.typeExpr(f);
    trace(Context.typeof(f));
    // if (Reflect.hasField(fType, 'args')) {
    //   var fArgs:Array<Dynamic> = Reflect.field(fType, 'args');
    //   trace(fArgs);
    //   return macro $v{fArgs};
    // } else {
    //   return macro [];
    // }
    return macro [];
  }
}