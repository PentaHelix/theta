package theta.components;

import haxe.Constraints.Function;
import theta.components.ComponentDeclaration;

@:autoBuild(theta.util.Macro.initComponent())
class Component {
  public var name:String;
  public final function new () {}
}